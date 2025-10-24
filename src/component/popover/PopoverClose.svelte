<script lang="ts">
	import { Popover as PopoverPrimitive } from 'bits-ui'
	import { cn } from '$/lib/utils'
	import type { Snippet } from 'svelte'
	import type { PopoverCloseProps } from 'bits-ui'

	export type Props = PopoverCloseProps & {
		/** Additional classes for the popover close button */
		class?: string
		/** Popover close button content */
		children: Snippet
	}

	const { class: className, children, ...props }: Props = $props()
</script>

<PopoverPrimitive.Close {...props} class={cn(className)}>
	{@render children()}
</PopoverPrimitive.Close>
