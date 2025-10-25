<script module lang="ts">
	import { defineMeta } from '@storybook/addon-svelte-csf'
	import { Time } from '@internationalized/date'
	import { TimeField } from './index'

	const { Story } = defineMeta({
		title: 'Components/TimeField',
		component: TimeField,
		tags: ['autodocs'],
		parameters: {
			docs: {
				controls: {
					include: [
						'granularity',
						'hourCycle',
						'locale',
						'minValue',
						'maxValue',
						'disabled',
						'readonly',
						'required',
					],
				},
			},
		},
	})
</script>

<script lang="ts">
	import type { Args } from 'storybook/internal/csf'
</script>

<Story
	args={{
		placeholder: new Time(9, 0),
	}}
	name="Default"
/>

<Story
	args={{
		placeholder: new Time(9, 0),
		value: new Time(14, 30),
	}}
	name="With Value"
/>

<Story
	args={{
		placeholder: new Time(9, 0),
		label: 'Appointment Time',
	}}
	name="With Label"
/>

<Story
	args={{
		placeholder: new Time(12, 30),
	}}
	name="Custom Placeholder"
/>

<Story
	args={{
		placeholder: new Time(9, 0),
		value: new Time(14, 30),
	}}
	name="Styled Example"
/>

<Story
	args={{
		placeholder: new Time(9, 0),
		granularity: 'hour',
	}}
	name="Hour Granularity"
/>

<Story
	args={{
		placeholder: new Time(12, 30, 15),
		granularity: 'second',
	}}
	name="Second Granularity"
/>

<Story
	args={{
		placeholder: new Time(9, 0),
		hourCycle: 24,
	}}
	name="Hour Cycle 24"
/>

<Story
	args={{
		placeholder: new Time(9, 0),
		minValue: new Time(8, 0),
		value: new Time(7, 0),
	}}
	name="With Min Value (Invalid)"
/>

<Story
	args={{
		placeholder: new Time(9, 0),
		maxValue: new Time(17, 0),
		value: new Time(18, 0),
	}}
	name="With Max Value (Invalid)"
/>

<Story
	args={{
		placeholder: new Time(9, 0),
		minValue: new Time(8, 0),
		maxValue: new Time(17, 0),
		value: new Time(15, 0),
	}}
	name="With Min/Max Values (Valid)"
/>

<Story
	args={{
		placeholder: new Time(9, 0),
		locale: 'de-DE',
		value: new Time(13, 30),
	}}
	name="German Locale"
/>

<Story
	args={{
		placeholder: new Time(9, 0),
		disabled: true,
	}}
	name="Disabled"
/>

<Story
	args={{
		placeholder: new Time(9, 0),
		value: new Time(14, 30),
		readonly: true,
	}}
	name="Readonly"
/>

<Story
	args={{
		placeholder: new Time(9, 0),
		required: true,
	}}
	name="Required"
/>

{#snippet controlledTemplate(args: Args)}
	<div class="space-y-4">
		<div class="bg-muted rounded p-4">
			<p class="mb-2 text-sm font-medium">Time Field State</p>
			<div class="space-y-1">
				<p class="text-xs">Selected: {args.value?.toString() || 'None'}</p>
				<p class="text-xs">Placeholder: {args.placeholder?.toString() || 'None'}</p>
			</div>
		</div>

		<TimeField bind:value={args.value} bind:placeholder={args.placeholder} />

		<div class="flex flex-wrap gap-2">
			<button
				class="bg-primary text-primary-foreground hover:bg-primary/90 rounded px-3 py-1 text-sm"
				onclick={() => (args.value = new Time(12, 30))}
			>
				Set to 12:30 PM
			</button>
			<button
				class="bg-secondary text-secondary-foreground hover:bg-secondary/90 rounded px-3 py-1 text-sm"
				onclick={() => (args.value = undefined)}
			>
				Clear Selection
			</button>
			<button
				class="bg-accent text-accent-foreground hover:bg-accent/90 rounded px-3 py-1 text-sm"
				onclick={() => (args.value = new Time(9, 0))}
			>
				Set to 9:00 AM
			</button>
			<button
				class="bg-muted text-muted-foreground hover:bg-muted/90 rounded px-3 py-1 text-sm"
				onclick={() => (args.value = args.value?.add({ hours: 1 }))}
			>
				Add 1 Hour
			</button>
		</div>
	</div>
{/snippet}

<Story
	args={{
		value: undefined,
		placeholder: new Time(9, 0),
	}}
	name="Controlled"
	template={controlledTemplate}
/>
