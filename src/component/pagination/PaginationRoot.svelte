<script lang="ts">
	import { Pagination } from 'bits-ui'
	import { cn } from '$/lib/utils'
	import type { Snippet } from 'svelte'
	import type { PaginationRootProps } from 'bits-ui'

	export type Page = {
		type: 'page'
		value: number
	}

	export type Ellipsis = {
		type: 'ellipsis'
	}

	export type PageItem = (Page | Ellipsis) & {
		key: string
	}

	export type PaginationSnippetProps = {
		pages: PageItem[]
		range: {
			start: number
			end: number
		}
		currentPage: number
	}

	export type Props = PaginationRootProps & {
		/** Additional classes for the pagination container */
		class?: string
		/** Pagination content */
		children?: Snippet<[PaginationSnippetProps]>
	}

	let { class: className, children, ...props }: Props = $props()

	const containerClasses = $derived(cn('flex flex-col items-center gap-2', className))
</script>

<Pagination.Root {...props} class={containerClasses}>
	{#snippet children(snippetProps)}
		{#if children}
			{@render children(snippetProps)}
		{/if}
	{/snippet}
</Pagination.Root>
