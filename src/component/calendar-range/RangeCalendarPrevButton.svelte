<script lang="ts">
	import { RangeCalendar } from 'bits-ui'
	import { ChevronLeft } from '@lucide/svelte'
	import { cn } from '$/lib/utils'
	import type { RangeCalendarPrevButtonProps } from 'bits-ui'

	export type Props = RangeCalendarPrevButtonProps & {
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

<RangeCalendar.PrevButton {...props} class={classes}>
	<ChevronLeft class="size-6" />
</RangeCalendar.PrevButton>
