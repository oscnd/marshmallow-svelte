<script lang="ts">
	import { Popover as PopoverPrimitive } from 'bits-ui'
	import { cn } from '$/lib/utils'
	import type { Snippet } from 'svelte'
	import type { PopoverContentProps } from 'bits-ui'

	export type Props = PopoverContentProps & {
		/** Additional classes for the popover content */
		class?: string
		/** Popover content */
		children: Snippet
	}

	const { class: className, children, ...props }: Props = $props()

	const classes = $derived(
		cn(
			'z-50 w-72 rounded-md border bg-popover p-4 text-popover-foreground shadow-md outline-none data-[state=open]:animate-in data-[state=closed]:animate-out data-[state=closed]:fade-out-0 data-[state=open]:fade-in-0 data-[state=closed]:zoom-out-95 data-[state=open]:zoom-in-95 data-[side=bottom]:slide-in-from-top-2 data-[side=left]:slide-in-from-right-2 data-[side=right]:slide-in-from-left-2 data-[side=top]:slide-in-from-bottom-2',
			className
		)
	)
</script>

<PopoverPrimitive.Portal>
	<PopoverPrimitive.Content {...props} class={classes}>
		{@render children()}
	</PopoverPrimitive.Content>
</PopoverPrimitive.Portal>