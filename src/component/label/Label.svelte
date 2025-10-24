<script lang="ts">
	import { Label } from 'bits-ui'
	import { cn } from '$/lib/utils'
	import type { Snippet } from 'svelte'
	import type { LabelRootProps } from 'bits-ui'

	export type Props = LabelRootProps & {
		/** Additional classes for the label */
		class?: string
	}

	let { class: className, children, ...props }: Props = $props()

	const classes = $derived(
		cn('text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70', className)
	)
</script>

<Label.Root {...props} class={classes} data-label-root>
	{#if children}
		{@render children()}
	{/if}
</Label.Root>
