<script lang="ts">
	import { RangeCalendar } from 'bits-ui'
	import { ChevronRight } from '@lucide/svelte'
	import { cn } from '$/lib/utils'
	import type { RangeCalendarNextButtonProps } from 'bits-ui'

	export type Props = RangeCalendarNextButtonProps & {
		class?: string
	}

	let { class: className, ...props }: Props = $props()

	const classes = $derived(
		cn(
			'rounded-9px bg-background-alt hover:bg-muted inline-flex size-10 items-center justify-center active:scale-[0.98]',
			className
		)
	)
</script>

<RangeCalendar.NextButton {...props} class={classes}>
	<ChevronRight class="size-6" />
</RangeCalendar.NextButton>
