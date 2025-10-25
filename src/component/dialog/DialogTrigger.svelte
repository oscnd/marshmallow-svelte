<script lang="ts">
	import { Dialog, type DialogTriggerProps } from 'bits-ui'
	import { cn } from '$/lib/utils.js'
	import type { Snippet } from 'svelte'

	export type Props = DialogTriggerProps & {
		/** Additional classes for the dialog trigger */
		class?: string
		/** Dialog trigger content */
		children: Snippet
	}

	const { class: className, children, ...props }: Props = $props()

	const classes = $derived(cn('inline-flex items-center justify-center font-medium transition-colors', className))
</script>

<Dialog.Trigger {...props} class={classes}>
	{@render children()}
</Dialog.Trigger>
