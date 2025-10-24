<script lang="ts">
	import { Popover as PopoverPrimitive } from 'bits-ui'
	import type { Snippet } from 'svelte'
	import type { PopoverRootProps } from 'bits-ui'

	export type Props = PopoverRootProps & {
		/** Additional classes for the popover */
		class?: string
		/** Popover content */
		children: Snippet
	}

	let { class: className, children, open = $bindable(false), ...props }: Props = $props()
</script>

<PopoverPrimitive.Root {...props} bind:open>
	{@render children()}
</PopoverPrimitive.Root>
