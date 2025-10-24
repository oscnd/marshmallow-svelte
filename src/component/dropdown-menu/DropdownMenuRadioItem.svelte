<script lang="ts">
	import '$/style/tailwind.css'
	import { DropdownMenu, type DropdownMenuRadioItemProps } from 'bits-ui'
	import { cn } from '$/lib/utils'
	import type { Snippet } from 'svelte'
	import { CircleDot, Circle } from '@lucide/svelte'

	export type Props = DropdownMenuRadioItemProps & {
		children?: Snippet<[{ checked: boolean }]>
		class?: string
		text?: string
	}

	const { class: className, children, text, ...props }: Props = $props()

	const classes = $derived(
		cn(
			'relative flex cursor-default select-none items-center rounded-sm py-1.5 pl-8 pr-2 text-sm outline-none transition-colors focus:bg-gray-100 focus:text-gray-900 data-[disabled]:pointer-events-none data-[disabled]:opacity-50',
			className
		)
	)
</script>

<DropdownMenu.RadioItem {...props} class={classes}>
	{#snippet children({ checked })}
		{#if children}
			{@render children({ checked })}
		{:else}
			<span class="absolute left-2 flex h-3.5 w-3.5 items-center justify-center">
				{#if checked}
					<CircleDot class="h-4 w-4" />
				{:else}
					<Circle class="h-4 w-4" />
				{/if}
			</span>
			{text || 'Radio Item'}
		{/if}
	{/snippet}
</DropdownMenu.RadioItem>
