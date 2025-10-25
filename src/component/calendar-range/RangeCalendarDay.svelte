<script lang="ts">
	import { RangeCalendar } from 'bits-ui'
	import { cn } from '$/lib/utils'
	import type { RangeCalendarDayProps } from 'bits-ui'

	export type Props = RangeCalendarDayProps & {
		class?: string
	}

	let { class: className, ...props }: Props = $props()

	const classes = $derived(
		cn(
			'group relative inline-flex h-9 w-9 items-center justify-center text-sm font-normal ring-offset-background transition-colors hover:text-accent-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2',
			'data-[selection-start]:bg-primary data-[selection-start]:text-primary-foreground data-[selection-start]:rounded-l-md data-[selection-start]:z-30',
			'data-[selection-end]:bg-primary data-[selection-end]:text-primary-foreground data-[selection-end]:rounded-r-md data-[selection-end]:z-30',
			'data-[selection-start][data-selection-end]:rounded-md data-[selection-start][data-selection-end]:z-40',
			'data-[selected]:bg-muted data-[selected]:text-foreground data-[selected]:z-10 data-[selected]:-mx-8 data-[selected]:rounded-none',
			'data-[disabled]:text-muted-foreground data-[disabled]:opacity-50',
			'data-[outside-month]:text-muted-foreground data-[outside-month]:opacity-50',
			'data-highlighted:border-b-1',
			'data-unavailable:text-muted-foreground data-unavailable:line-through',
			'before:absolute before:top-1 before:left-1/2 before:-translate-x-1/2 before:h-1 before:w-1 before:rounded-full before:bg-primary data-[selection-start]:before:bg-background data-[selection-end]:before:bg-background data-[selected]:before:bg-muted before:hidden data-[today]:before:block',
			className
		)
	)
</script>

<RangeCalendar.Day {...props} class={classes} />
