<script lang="ts">
	import { cn } from '$/lib/utils'
	import type { Snippet } from 'svelte'

	export type Props = {
		/** Additional classes for the dialog footer */
		class?: string
		/** Footer content */
		children: Snippet
	}

	const { class: className, children }: Props = $props()

	const classes = $derived(cn('flex flex-col-reverse sm:flex-row sm:justify-end sm:space-x-2', className))
</script>

<div class={classes}>
	{@render children()}
</div>
