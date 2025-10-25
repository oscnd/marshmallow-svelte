<script lang="ts">
	import { Dialog as DialogPrimitive } from 'bits-ui'
	import { cn } from '$/lib/utils'
	import type { Snippet } from 'svelte'
	import type { DialogTitleProps } from 'bits-ui'

	export type Props = DialogTitleProps & {
		/** Additional classes for the dialog title */
		class?: string
		/** Title content */
		children: Snippet
	}

	const { class: className, children, ...props }: Props = $props()

	const classes = $derived(cn('text-lg font-semibold leading-none tracking-tight', className))
</script>

<DialogPrimitive.Title {...props} class={classes}>
	{@render children()}
</DialogPrimitive.Title>
