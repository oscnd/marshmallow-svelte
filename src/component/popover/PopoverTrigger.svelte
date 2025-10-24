<script lang="ts">
	import { Popover as PopoverPrimitive } from 'bits-ui'
	import { cn } from '$/lib/utils'
	import type { Snippet } from 'svelte'
	import type { PopoverTriggerProps } from 'bits-ui'

	export type Props = PopoverTriggerProps & {
		/** Additional classes for the popover trigger */
		class?: string
		/** Popover trigger content */
		children: Snippet
	}

	const { class: className, children, ...props }: Props = $props()
</script>

<PopoverPrimitive.Trigger {...props} class={cn(className)}>
	{@render children()}
</PopoverPrimitive.Trigger>
