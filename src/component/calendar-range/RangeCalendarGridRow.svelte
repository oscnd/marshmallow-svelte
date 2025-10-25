<script lang="ts">
	import { RangeCalendar } from 'bits-ui'
	import { cn } from '$/lib/utils'
	import type { RangeCalendarGridRowProps } from 'bits-ui'

	export type Props = RangeCalendarGridRowProps & {
		class?: string
	}

	let { class: className, ...props }: Props = $props()

	const classes = $derived(cn('relative gap-0 [&>[data-selected]+[data-selected]]:border-l-0 [&>[data-selected]+[data-selected]]:bg-muted [&>[data-selected]:last-child]:after:absolute [&>[data-selected]:last-child]:after:inset-y-0 [&>[data-selected]:last-child]:after:right-0 [&>[data-selected]:last-child]:after:bg-muted [&>[data-selected]:last-child]:after:z-0 [&>[data-selected]:first-child]:before:absolute [&>[data-selected]:first-child]:before:inset-y-0 [&>[data-selected]:first-child]:before:left-0 [&>[data-selected]:first-child]:before:w-12 [&>[data-selected]:first-child]:before:bg-muted [&>[data-selected]:first-child]:before:z-0', className))
</script>

<RangeCalendar.GridRow {...props} class={classes} />
