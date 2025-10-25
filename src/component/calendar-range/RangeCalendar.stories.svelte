<script module lang="ts">
	import { defineMeta } from '@storybook/addon-svelte-csf'
	import { CalendarDate } from '@internationalized/date'
	import { RangeCalendar } from './index'
	import { getLocalTimeZone } from '$/lib/util/time'

	const { Story } = defineMeta({
		title: 'Components/RangeCalendar',
		component: RangeCalendar,
		tags: ['autodocs'],
		parameters: {
			docs: {
				controls: {
					include: [
						'placeholder',
						'minValue',
						'maxValue',
						'minDays',
						'maxDays',
						'disabled',
						'readonly',
						'numberOfMonths',
						'pagedNavigation',
						'fixedWeeks',
						'excludeDisabled',
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
		placeholder: new CalendarDate(2024, 1, 15),
	}}
	name="Default"
/>

<Story
	args={{
		placeholder: new CalendarDate(2024, 1, 15),
		minDays: 3,
		maxDays: 10,
	}}
	name="With Min/Max Days"
/>

<Story
	args={{
		placeholder: new CalendarDate(2024, 1, 15),
		minValue: new CalendarDate(2024, 1, 1),
		maxValue: new CalendarDate(2024, 1, 31),
	}}
	name="With Date Range"
/>

<Story
	args={{
		placeholder: new CalendarDate(2024, 1, 15),
		disabled: true,
	}}
	name="Disabled"
/>

<Story
	args={{
		placeholder: new CalendarDate(2024, 1, 15),
		readonly: true,
	}}
	name="Readonly"
/>

<Story
	args={{
		placeholder: new CalendarDate(2024, 1, 15),
		numberOfMonths: 2,
	}}
	name="Multiple Months"
/>

<Story
	args={{
		placeholder: new CalendarDate(2024, 1, 15),
		fixedWeeks: true,
	}}
	name="Fixed Weeks"
/>

{#snippet controlledTemplate(args: Args)}
	<div class="space-y-4">
		<div class="bg-muted rounded p-4">
			<p class="mb-2 text-sm font-medium">Range Calendar State</p>
			<div class="space-y-1">
				<p class="text-xs">
					Selected Range: {args.value?.start?.toString() || 'None'} - {args.value?.end?.toString() || 'None'}
				</p>
				<p class="text-xs">Placeholder: {args.placeholder?.toString() || 'None'}</p>
			</div>
		</div>

		<RangeCalendar bind:value={args.value} bind:placeholder={args.placeholder} {...args} />

		<div class="flex gap-2">
			<button
				class="bg-primary text-primary-foreground hover:bg-primary/90 rounded px-3 py-1 text-sm"
				onclick={() =>
					(args.value = {
						start: new CalendarDate(2024, 1, 10),
						end: new CalendarDate(2024, 1, 15),
					})}
			>
				Set Range (Jan 10-15)
			</button>
			<button
				class="bg-secondary text-secondary-foreground hover:bg-secondary/90 rounded px-3 py-1 text-sm"
				onclick={() => (args.value = undefined)}
			>
				Clear Selection
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
