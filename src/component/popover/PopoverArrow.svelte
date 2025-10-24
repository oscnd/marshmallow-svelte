<script lang="ts">
	import { Popover as PopoverPrimitive } from 'bits-ui'
	import { cn } from '$/lib/utils'
	import type { PopoverArrowProps } from 'bits-ui'

	export type Props = PopoverArrowProps & {
		/** Additional classes for the popover arrow */
		class?: string
	}

	const { class: className, ...props }: Props = $props()

	const classes = $derived(cn('w-2 h-2 bg-popover', className))
</script>

<PopoverPrimitive.Arrow {...props} class={classes} />