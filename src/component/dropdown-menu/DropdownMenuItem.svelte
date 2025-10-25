<script lang="ts">
	import { DropdownMenu, type DropdownMenuItemProps } from 'bits-ui'
	import { cn } from '$/lib/utils'
	import type { Snippet } from 'svelte'

	export type Props = DropdownMenuItemProps & {
		children?: Snippet
		class?: string
	}

	const { class: className, children, ...props }: Props = $props()

	const classes = $derived(
		cn(
			'relative flex cursor-default select-none items-center rounded-sm px-2 py-1.5 text-sm outline-none transition-colors focus:bg-gray-100 focus:text-gray-900 data-[disabled]:pointer-events-none data-[disabled]:opacity-50',
			className
		)
	)
</script>

<DropdownMenu.Item {...props} class={classes}>
	{#if children}
		{@render children()}
	{/if}
</DropdownMenu.Item>
