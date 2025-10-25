<script lang="ts">
	import { Calendar as CalendarPrimitive } from 'bits-ui'
	import { ChevronRight } from '@lucide/svelte'
	import { cn } from '$/lib/utils'
	import type { CalendarNextButtonProps } from 'bits-ui'

	export type Props = CalendarNextButtonProps & {
		class?: string
	}

	let { class: className, ...props }: Props = $props()

	const classes = $derived(
		cn(
			'inline-flex items-center justify-center rounded-md bg-background hover:bg-accent transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 h-9 w-9 flex-shrink-0',
			className
		)
	)
</script>

<CalendarPrimitive.NextButton {...props} class={classes}>
	<ChevronRight class="h-4 w-4" />
</CalendarPrimitive.NextButton>
