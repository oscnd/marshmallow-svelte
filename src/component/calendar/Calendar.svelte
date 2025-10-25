<script lang="ts">
	import { cn } from '$/lib/utils'
	import CalendarRoot from './CalendarRoot.svelte'
	import CalendarHeader from './CalendarHeader.svelte'
	import CalendarHeading from './CalendarHeading.svelte'
	import CalendarPrevButton from './CalendarPrevButton.svelte'
	import CalendarNextButton from './CalendarNextButton.svelte'
	import CalendarGrid from './CalendarGrid.svelte'
	import CalendarGridHead from './CalendarGridHead.svelte'
	import CalendarGridBody from './CalendarGridBody.svelte'
	import CalendarGridRow from './CalendarGridRow.svelte'
	import CalendarHeadCell from './CalendarHeadCell.svelte'
	import CalendarCell from './CalendarCell.svelte'
	import CalendarDay from './CalendarDay.svelte'
	import type { Snippet } from 'svelte'
	import type { DateValue } from '@internationalized/date'
	import type { CalendarRootProps } from 'bits-ui'

	export type Props = CalendarRootProps & {
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

<CalendarRoot {...props} class={className} bind:value bind:placeholder>
	{#snippet children({ months, weekdays })}
		<CalendarHeader class={headerClass}>
			<CalendarPrevButton />
			<CalendarHeading />
			<CalendarNextButton />
		</CalendarHeader>

		<CalendarGrid class={gridClass}>
				<CalendarGridHead>
					<CalendarGridRow>
						{#each weekdays as weekday, i (i)}
							<CalendarHeadCell>
								<div class="text-muted-foreground h-10 w-10 text-center text-sm font-medium">
									{weekday.slice(0, 2)}
								</div>
							</CalendarHeadCell>
						{/each}
					</CalendarGridRow>
				</CalendarGridHead>
				<CalendarGridBody>
					{#each months as month, i (i)}
						{#each month.weeks as weekDates, i (i)}
							<CalendarGridRow>
								{#each weekDates as date, i (i)}
									<CalendarCell class={cellClass} month={month.value} {date}>
										<CalendarDay class={dayClass} />
									</CalendarCell>
								{/each}
							</CalendarGridRow>
						{/each}
					{/each}
				</CalendarGridBody>
			</CalendarGrid>
	{/snippet}
</CalendarRoot>
