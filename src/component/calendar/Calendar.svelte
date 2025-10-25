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

	const calendarClasses = $derived(cn('p-3', className))

	const headerClasses = $derived(cn('flex items-center justify-between mb-4', headerClass))

	const gridClasses = $derived(cn('w-full border-collapse space-y-1', gridClass))

	const cellClasses = $derived(
		cn('relative p-0 text-center text-sm focus-within:relative focus-within:z-20', cellClass)
	)

	const dayClasses = $derived(
		cn(
			'group relative inline-flex h-9 w-9 items-center justify-center rounded-md text-sm font-normal ring-offset-background transition-colors hover:bg-accent hover:text-accent-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2',
			'data-[selected]:bg-primary data-[selected]:text-primary-foreground',
			'data-[disabled]:text-muted-foreground data-[disabled]:opacity-50',
			'data-[outside-month]:text-muted-foreground data-[outside-month]:opacity-50',
			'data-[today]:bg-accent data-[today]:text-accent-foreground',
			'before:absolute before:top-1.5 before:left-1/2 before:-translate-x-1/2 before:h-1 before:w-1 before:rounded-full before:bg-primary group-data-selected:before:bg-background data-[today]:before:block data-[not-today]:before:hidden',
			dayClass
		)
	)
</script>

<CalendarRoot {...props} class={calendarClasses} bind:value bind:placeholder>
	{#snippet children({ months, weekdays })}
		<div class={headerClasses}>
			<CalendarHeader>
				<CalendarPrevButton />
				<CalendarHeading />
				<CalendarNextButton />
			</CalendarHeader>
		</div>

		<div class={gridClasses}>
			<CalendarGrid>
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
									<CalendarCell class={cellClasses} month={month.value} {date}>
										<CalendarDay class={dayClasses} />
									</CalendarCell>
								{/each}
							</CalendarGridRow>
						{/each}
					{/each}
				</CalendarGridBody>
			</CalendarGrid>
		</div>
	{/snippet}
</CalendarRoot>
