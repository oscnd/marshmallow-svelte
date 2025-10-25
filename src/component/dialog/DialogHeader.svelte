<script lang="ts">
	import { cn } from '$/lib/utils'
	import type { Snippet } from 'svelte'

	export type Props = {
		/** Additional classes for the dialog header */
		class?: string
		/** Header content */
		children: Snippet
	}

	const { class: className, children }: Props = $props()

	const classes = $derived(cn('flex flex-col space-y-1.5 text-center sm:text-left', className))
</script>

<div class={classes}>
	{@render children()}
</div>
