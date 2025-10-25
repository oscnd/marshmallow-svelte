<script lang="ts">
	import RangeCalendarRoot from './RangeCalendarRoot.svelte'
	import RangeCalendarHeader from './RangeCalendarHeader.svelte'
	import RangeCalendarHeading from './RangeCalendarHeading.svelte'
	import RangeCalendarPrevButton from './RangeCalendarPrevButton.svelte'
	import RangeCalendarNextButton from './RangeCalendarNextButton.svelte'
	import RangeCalendarGrid from './RangeCalendarGrid.svelte'
	import RangeCalendarGridHead from './RangeCalendarGridHead.svelte'
	import RangeCalendarGridBody from './RangeCalendarGridBody.svelte'
	import RangeCalendarGridRow from './RangeCalendarGridRow.svelte'
	import RangeCalendarHeadCell from './RangeCalendarHeadCell.svelte'
	import RangeCalendarCell from './RangeCalendarCell.svelte'
	import RangeCalendarDay from './RangeCalendarDay.svelte'
	import type { Snippet } from 'svelte'
	import type { DateValue } from '@internationalized/date'
	import type { RangeCalendarRootProps } from 'bits-ui'

	export type Props = RangeCalendarRootProps & {
		/** Additional classes for the calendar */
		class?: string
		/** Additional classes for the calendar header */
		headerClass?: string
		/** Additional classes for the calendar grid */
		gridClass?: string
		/** Additional classes for calendar cells */
		cellClass?: string
		/** Additional classes for calendar days */
		dayClass?: string
	}

	let {
		class: className,
		headerClass,
		gridClass,
		cellClass,
		dayClass,
		value = $bindable(),
		placeholder = $bindable(),
		...props
	}: Props = $props()
</script>

<RangeCalendarRoot {...props} class={className} bind:value bind:placeholder>
	{#snippet children({ months, weekdays })}
		<RangeCalendarHeader class={headerClass}>
			<RangeCalendarPrevButton />
			<RangeCalendarHeading />
			<RangeCalendarNextButton />
		</RangeCalendarHeader>

			<RangeCalendarGrid class={gridClass}>
			<RangeCalendarGridHead>
				<RangeCalendarGridRow>
					{#each weekdays as weekday, i (i)}
						<RangeCalendarHeadCell>
							<div class="text-muted-foreground h-10 w-10 text-center text-sm font-medium">
								{weekday.slice(0, 2)}
							</div>
						</RangeCalendarHeadCell>
					{/each}
				</RangeCalendarGridRow>
			</RangeCalendarGridHead>
			<RangeCalendarGridBody>
				{#each months as month, i (i)}
					{#each month.weeks as weekDates, i (i)}
						<RangeCalendarGridRow>
							{#each weekDates as date, i (i)}
								<RangeCalendarCell class={cellClass} month={month.value} {date}>
									<RangeCalendarDay class={dayClass} />
								</RangeCalendarCell>
							{/each}
						</RangeCalendarGridRow>
					{/each}
				{/each}
			</RangeCalendarGridBody>
		</RangeCalendarGrid>
	{/snippet}
</RangeCalendarRoot>
