<script lang="ts">
	import { Pagination } from 'bits-ui'
	import { cn } from '$/lib/utils'
	import type { Snippet } from 'svelte'
	import type { PaginationPageProps } from 'bits-ui'

	export type Props = PaginationPageProps & {
		/** Additional classes for the page button */
		class?: string
		/** Page content */
		children: Snippet
	}

	let { class: className, children, page, ...props }: Props = $props()

	const classes = $derived(
		cn(
			'inline-flex items-center justify-center w-10 h-10 text-sm font-medium transition-colors rounded-md border border-border hover:bg-accent hover:text-accent-foreground focus:outline-none focus:ring-2 focus:ring-ring focus:ring-offset-2 data-selected:bg-primary data-selected:text-primary-foreground data-selected:hover:bg-primary/90 data-selected:border-primary',
			className
		)
	)
</script>

<Pagination.Page {...props} {page} class={classes}>
	{@render children()}
</Pagination.Page>
