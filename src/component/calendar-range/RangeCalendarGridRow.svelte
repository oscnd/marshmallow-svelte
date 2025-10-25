<script lang="ts">
	import { RangeCalendar } from 'bits-ui'
	import { cn } from '$/lib/utils'
	import type { RangeCalendarGridRowProps } from 'bits-ui'

	export type Props = RangeCalendarGridRowProps

	let { class: className, ...props }: Props = $props()

	const classes = $derived(cn(className))
</script>

<RangeCalendar.GridRow {...props} class={classes} />
