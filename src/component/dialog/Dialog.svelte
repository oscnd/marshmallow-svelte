<script lang="ts">
	import { Dialog as DialogPrimitive } from 'bits-ui'
    import DialogContent from './DialogContent.svelte'
	import DialogHeader from './DialogHeader.svelte'
	import DialogTitle from './DialogTitle.svelte'
	import DialogDescription from './DialogDescription.svelte'
	import DialogFooter from './DialogFooter.svelte'
	import type { Snippet } from 'svelte'
	import type { DialogRootProps } from 'bits-ui'

	export type Props = DialogRootProps & {
		/** Additional classes for the dialog */
		class?: string
		/** Dialog content */
		children: Snippet
	}

	const { class: className, children, ...props }: Props = $props()
</script>

<DialogPrimitive.Root {...props}>
	{@render children()}
</DialogPrimitive.Root>
