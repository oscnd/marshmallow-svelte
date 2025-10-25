<script lang="ts">
	import { RangeCalendar } from 'bits-ui'
	import { cn } from '$/lib/utils'
	import type { RangeCalendarCellProps } from 'bits-ui'

	export type Props = RangeCalendarCellProps & {
		class?: string
	}

	let { class: className, ...props }: Props = $props()

	const classes = $derived(cn('relative p-0 text-center text-sm focus-within:relative focus-within:z-20', className))
</script>

<RangeCalendar.Cell {...props} class={classes} />
