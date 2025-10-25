<script lang="ts">
	import { RangeCalendar } from 'bits-ui'
	import { cn } from '$/lib/utils'
	import type { RangeCalendarHeadingProps } from 'bits-ui'

	export type Props = RangeCalendarHeadingProps & {
		class?: string
	}

	let { class: className, ...props }: Props = $props()

	const classes = $derived(cn('text-[15px] font-medium', className))
</script>

<RangeCalendar.Heading {...props} class={classes} />
