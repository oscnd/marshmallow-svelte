<script lang="ts">
	import { Separator as SeparatorPrimitive } from 'bits-ui'
	import { cn } from '$/lib/utils'
	import type { Snippet } from 'svelte'
	import type { SeparatorRootProps } from 'bits-ui'

	export type Props = SeparatorRootProps & {
		/** Additional classes for the separator */
		class?: string
		/** Separator content */
		children?: Snippet
	}

	let { class: className, children, orientation = 'horizontal', decorative = false, ...props }: Props = $props()

	const classes = $derived(
		cn('shrink-0 bg-border-card', orientation === 'horizontal' ? 'h-[1px] w-full' : 'h-full w-[1px]', className)
	)
</script>

<SeparatorPrimitive.Root {...props} {orientation} {decorative} class={classes}>
	{#if children}
		{@render children()}
	{/if}
</SeparatorPrimitive.Root>
