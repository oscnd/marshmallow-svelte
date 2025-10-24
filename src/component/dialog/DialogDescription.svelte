<script lang="ts">
	import { Dialog as DialogPrimitive } from 'bits-ui'
	import { cn } from '$/lib/utils'
	import type { Snippet } from 'svelte'
	import type { DialogDescriptionProps } from 'bits-ui'

	export type Props = DialogDescriptionProps & {
		/** Additional classes for the dialog description */
		class?: string
		/** Description content */
		children: Snippet
	}

	const { class: className, children, ...props }: Props = $props()

	const classes = $derived(cn('text-sm text-muted-foreground', className))
</script>

<DialogPrimitive.Description {...props} class={classes}>
	{@render children()}
</DialogPrimitive.Description>
