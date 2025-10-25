<script lang="ts">
	import { Dialog, type DialogCloseProps } from 'bits-ui'
	import { cn } from '$/lib/utils.js'
	import type { Snippet } from 'svelte'

	export type Props = DialogCloseProps & {
		/** Additional classes for the dialog close */
		class?: string
		/** Dialog close content */
		children: Snippet
	}

	const { class: className, children, ...props }: Props = $props()

	const classes = $derived(
		cn('inline-flex items-center justify-center font-medium transition-colors focus:outline-none', className)
	)
</script>

<Dialog.Close {...props} class={classes}>
	{@render children()}
</Dialog.Close>
