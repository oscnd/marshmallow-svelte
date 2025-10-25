<script lang="ts">
	import { Pagination } from 'bits-ui'
	import { cn } from '$/lib/utils.js'
	import { ChevronRight } from '@lucide/svelte'
	import type { PaginationNextButtonProps } from 'bits-ui'

	export type Props = PaginationNextButtonProps & {
		/** Additional classes for the next button */
		class?: string
		/** Show text instead of icon */
		showText?: boolean
	}

	let { class: className, showText = false, ...props }: Props = $props()

	const buttonClasses = $derived(
		cn(
			'inline-flex items-center justify-center w-10 h-10 text-sm font-medium transition-colors rounded-md border border-border hover:bg-accent hover:text-accent-foreground focus:outline-none focus:ring-2 focus:ring-ring focus:ring-offset-2 disabled:pointer-events-none disabled:opacity-50',
			className
		)
	)
</script>

<Pagination.NextButton {...props} class={buttonClasses}>
	{#if showText}
		Next
	{:else}
		<ChevronRight class="h-4 w-4" />
	{/if}
</Pagination.NextButton>
