<script lang="ts">
	import { Dialog } from 'bits-ui'
	import { cn } from '$/lib/utils'
	import type { Snippet } from 'svelte'
	import type { DialogContentProps } from 'bits-ui'

	export type Props = DialogContentProps & {
		/** Additional classes for the dialog content */
		class?: string
		/** Dialog content */
		children: Snippet
	}

	const { class: className, children, ...props }: Props = $props()

	const classes = $derived(
		cn(
			'fixed left-[50%] top-[50%] z-50 w-full max-w-[calc(100%-2rem)] translate-x-[-50%] translate-y-[-50%] border rounded-lg bg-background shadow-popover p-5 outline-hidden data-[state=open]:animate-in data-[state=closed]:animate-out data-[state=closed]:fade-out-0 data-[state=open]:fade-in-0 data-[state=closed]:zoom-out-95 data-[state=open]:zoom-in-95 sm:max-w-[490px] md:w-full',
			className
		)
	)
</script>

<Dialog.Portal>
	<Dialog.Overlay
		class="data-[state=open]:animate-in data-[state=closed]:animate-out data-[state=closed]:fade-out-0 data-[state=open]:fade-in-0 fixed inset-0 bg-black/80"
	/>
	<Dialog.Content {...props} class={classes}>
		{@render children()}
	</Dialog.Content>
</Dialog.Portal>
