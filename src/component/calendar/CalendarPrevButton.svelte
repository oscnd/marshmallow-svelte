<script lang="ts">
	import { Calendar } from 'bits-ui'
	import { ChevronLeft } from '@lucide/svelte'
	import { cn } from '$/lib/utils'
	import type { CalendarPrevButtonProps } from 'bits-ui'

	export type Props = CalendarPrevButtonProps & {
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

<Calendar.PrevButton {...props} class={classes}>
	<ChevronLeft class="h-4 w-4" />
</Calendar.PrevButton>
