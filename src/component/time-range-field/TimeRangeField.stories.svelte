<script module lang="ts">
	import { defineMeta } from '@storybook/addon-svelte-csf'
	import { Time } from '@internationalized/date'
	import { TimeRangeField } from './index'

	const { Story } = defineMeta({
		title: 'Components/TimeRangeField',
		component: TimeRangeField,
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
		value: { start: new Time(9, 0), end: new Time(17, 0) },
	}}
	name="With Values"
/>

<Story
	args={{
		placeholder: new Time(9, 0),
		label: 'Working Hours',
	}}
	name="With Label"
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
		placeholder: new Time(9, 0),
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
		maxValue: new Time(18, 0),
	}}
	name="With Min/Max"
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
		readonly: true,
		value: { start: new Time(9, 0), end: new Time(17, 0) },
	}}
	name="Readonly"
/>

<Story
	args={{
		placeholder: new Time(9, 0),
		locale: 'de-DE',
	}}
	name="German Locale"
/>

<Story
	args={{
		placeholder: new Time(9, 0),
		value: { start: new Time(23, 30), end: new Time(1, 30) },
	}}
	name="Overnight Range"
/>

{#snippet controlledTemplate(args: Args)}
	<div class="space-y-4">
		<div class="bg-muted rounded p-4">
			<p class="mb-2 text-sm font-medium">Time Range State</p>
			<div class="space-y-1">
				<p class="text-xs">Start: {args.value?.start?.toString() || 'None'}</p>
				<p class="text-xs">End: {args.value?.end?.toString() || 'None'}</p>
				<p class="text-xs">Placeholder: {args.placeholder?.toString() || 'None'}</p>
			</div>
		</div>

		<TimeRangeField bind:value={args.value} bind:placeholder={args.placeholder} />

		<div class="flex flex-wrap gap-2">
			<button
				class="bg-primary text-primary-foreground hover:bg-primary/90 rounded px-3 py-1 text-sm"
				onclick={() => (args.value = { start: new Time(9, 0), end: new Time(17, 0) })}
			>
				Set 9AM-5PM
			</button>
			<button
				class="bg-secondary text-secondary-foreground hover:bg-secondary/90 rounded px-3 py-1 text-sm"
				onclick={() => (args.value = undefined)}
			>
				Clear
			</button>
			<button
				class="bg-accent text-accent-foreground hover:bg-accent/90 rounded px-3 py-1 text-sm"
				onclick={() => (args.value = { start: new Time(14, 30), end: new Time(16, 0) })}
			>
				Set 2:30PM-4PM
			</button>
			<button
				class="bg-muted text-muted-foreground hover:bg-muted/90 rounded px-3 py-1 text-sm"
				onclick={() => (args.value = { start: args.value?.start, end: new Time(23, 59) })}
			>
				End at 11:59 PM
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
