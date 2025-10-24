<script lang="ts">
	import { cn } from '$/lib/utils.js'
	import type { Snippet } from 'svelte'

	export type Props = {
		/** Additional classes for the pagination content */
		class?: string
		/** Pagination content */
		children: Snippet
	}

	let { class: className, children }: Props = $props()

	const contentClasses = $derived(cn('flex gap-1', className))
</script>

<nav class={contentClasses}>
	{@render children()}
</nav>
