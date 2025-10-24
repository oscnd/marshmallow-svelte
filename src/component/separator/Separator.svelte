<script lang="ts">
	import SeparatorRoot from './SeparatorRoot.svelte'
	import type { Props as SeparatorRootProps } from './SeparatorRoot.svelte'
	import type { Snippet } from 'svelte'
	import { cn } from '$/lib/utils'

	export type Props = SeparatorRootProps & {
		/** Additional classes for the separator */
		class?: string
		/** Separator content */
		children?: Snippet
	}

	let {
		class: className,
		children,
		orientation = 'horizontal',
		decorative = false,
		...props
	}: Props = $props()

	const classes = $derived(cn(className))
</script>

<SeparatorRoot {...props} {orientation} {decorative} class={classes}>
	{#if children}
		{@render children()}
	{/if}
</SeparatorRoot>