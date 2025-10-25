<script lang="ts">
	import { RangeCalendar } from 'bits-ui'
	import { cn } from '$/lib/utils'
	import type { RangeCalendarHeaderProps } from 'bits-ui'

	export type Props = RangeCalendarHeaderProps & {
		class?: string
	}

	let { class: className, ...props }: Props = $props()

	const classes = $derived(cn('flex items-center justify-between', className))
</script>

<RangeCalendar.Header {...props} class={classes} />
