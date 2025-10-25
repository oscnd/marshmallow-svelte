<script lang="ts">
	import { Pagination } from 'bits-ui'
	import { cn } from '$/lib/utils'
	import { ChevronLeft } from '@lucide/svelte'
	import type { PaginationPrevButtonProps } from 'bits-ui'

	export type Props = PaginationPrevButtonProps & {
		/** Additional classes for the previous button */
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

<Pagination.PrevButton {...props} class={buttonClasses}>
	{#if showText}
		Previous
	{:else}
		<ChevronLeft class="h-4 w-4" />
	{/if}
</Pagination.PrevButton>
