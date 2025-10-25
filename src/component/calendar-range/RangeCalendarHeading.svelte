<script lang="ts">
	import { RangeCalendar } from 'bits-ui'
	import { cn } from '$/lib/utils'
	import type { RangeCalendarHeadingProps } from 'bits-ui'

	export type Props = RangeCalendarHeadingProps & {
		class?: string
	}

	let { class: className, ...props }: Props = $props()

	const classes = $derived(className)
</script>

<RangeCalendar.Heading {...props} class={classes} />
