<script lang="ts">
	import { RangeCalendar } from 'bits-ui'
	import { cn } from '$/lib/utils'
	import type { RangeCalendarGridProps } from 'bits-ui'

	export type Props = RangeCalendarGridProps & {
		class?: string
	}

	let { class: className, ...props }: Props = $props()

	const classes = $derived(cn('w-full border-collapse space-y-1', className))
</script>

<RangeCalendar.Grid {...props} class={classes} />
