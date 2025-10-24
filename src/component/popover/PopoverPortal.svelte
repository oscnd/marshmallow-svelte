<script lang="ts">
	import { Popover as PopoverPrimitive } from 'bits-ui'
	import { cn } from '$/lib/utils'
	import type { Snippet } from 'svelte'
	import type { PopoverPortalProps } from 'bits-ui'

	export type Props = PopoverPortalProps & {
		/** Additional classes for the popover portal */
		class?: string
		/** Portal content */
		children: Snippet
	}

	const { class: className, children, ...props }: Props = $props()
</script>

<PopoverPrimitive.Portal {...props}>
	{@render children()}
</PopoverPrimitive.Portal>