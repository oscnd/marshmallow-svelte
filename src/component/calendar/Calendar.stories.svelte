<script module lang="ts">
	import { defineMeta } from '@storybook/addon-svelte-csf'
	import { CalendarDate, today } from '@internationalized/date'
	import { Calendar } from './index'
	import { getLocalTimeZone } from '$/lib/util/time'

	const { Story } = defineMeta({
		title: 'Components/Calendar',
		component: Calendar,
		tags: ['autodocs'],
		parameters: {
			docs: {
				controls: {
					include: [
						'type',
						'placeholder',
						'minValue',
						'maxValue',
						'disabled',
						'readonly',
						'numberOfMonths',
						'pagedNavigation',
						'fixedWeeks',
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
		type: 'single',
		placeholder: new CalendarDate(2024, 1, 15),
	}}
	name="Single Selection"
/>

<Story
	args={{
		type: 'multiple',
		placeholder: new CalendarDate(2024, 1, 15),
	}}
	name="Multiple Selection"
/>

<Story
	args={{
		type: 'single',
		placeholder: new CalendarDate(2024, 1, 15),
		minValue: new CalendarDate(2024, 1, 1),
		maxValue: new CalendarDate(2024, 1, 31),
	}}
	name="With Date Range"
/>

<Story
	args={{
		type: 'single',
		placeholder: new CalendarDate(2024, 1, 15),
		disabled: true,
	}}
	name="Disabled"
/>

<Story
	args={{
		type: 'single',
		placeholder: new CalendarDate(2024, 1, 15),
		readonly: true,
		value: new CalendarDate(2024, 1, 10),
	}}
	name="Readonly"
/>

<Story
	args={{
		type: 'single',
		placeholder: new CalendarDate(2024, 1, 15),
		numberOfMonths: 2,
	}}
	name="Multiple Months"
/>

<Story
	args={{
		type: 'single',
		placeholder: new CalendarDate(2024, 1, 15),
		fixedWeeks: true,
	}}
	name="Fixed Weeks"
/>

<Story
	args={{
		type: 'single',
		placeholder: today(getLocalTimeZone()),
		value: today(getLocalTimeZone()),
	}}
	name="Today Selected"
/>

{#snippet controlledTemplate(args: Args)}
	<div class="space-y-4">
		<div class="bg-muted rounded p-4">
			<p class="mb-2 text-sm font-medium">Calendar State</p>
			<div class="space-y-1">
				<p class="text-xs">Selected: {args.value?.toString() || 'None'}</p>
				<p class="text-xs">Placeholder: {args.placeholder?.toString() || 'None'}</p>
			</div>
		</div>

		<Calendar type="single" bind:value={args.value} bind:placeholder={args.placeholder} />

		<div class="flex gap-2">
			<button
				class="bg-primary text-primary-foreground hover:bg-primary/90 rounded px-3 py-1 text-sm"
				onclick={() => (args.value = new CalendarDate(2024, 1, 20))}
			>
				Set to Jan 20
			</button>
			<button
				class="bg-secondary text-secondary-foreground hover:bg-secondary/90 rounded px-3 py-1 text-sm"
				onclick={() => (args.value = undefined)}
			>
				Clear Selection
			</button>
			<button
				class="bg-accent text-accent-foreground hover:bg-accent/90 rounded px-3 py-1 text-sm"
				onclick={() => (args.value = new CalendarDate(2024, 6, 15))}
			>
				Jump to June
			</button>
		</div>
	</div>
{/snippet}

<Story
	args={{
		value: undefined,
		placeholder: new CalendarDate(2024, 1, 15),
	}}
	name="Controlled"
	template={controlledTemplate}
/>
