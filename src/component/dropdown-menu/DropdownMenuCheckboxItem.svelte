<script lang="ts">
	import '$/style/tailwind.css'
	import { DropdownMenu, type DropdownMenuCheckboxItemProps } from 'bits-ui'
	import { cn } from '$/lib/utils'
	import type { Snippet } from 'svelte'
	import { Check } from '@lucide/svelte'

	export type Props = DropdownMenuCheckboxItemProps & {
		children?: Snippet<[{ checked: boolean; indeterminate: boolean }]>
		class?: string
		text?: string
	}

	let { class: className, children, text, checked = $bindable(false), ...props }: Props = $props()

	const classes = $derived(
		cn(
			'relative flex cursor-default select-none items-center rounded-sm py-1.5 pl-8 pr-2 text-sm outline-none transition-colors focus:bg-gray-100 focus:text-gray-900 data-[disabled]:pointer-events-none data-[disabled]:opacity-50',
			className
		)
	)
</script>

<DropdownMenu.CheckboxItem {...props} bind:checked class={classes} closeOnSelect={false}>
	{#snippet children({ checked, indeterminate })}
		{#if children}
			{@render children({ checked, indeterminate })}
		{:else}
			<span class="absolute left-2 flex h-3.5 w-3.5 items-center justify-center">
				{#if checked || indeterminate}
					<Check class="h-4 w-4" />
				{/if}
			</span>
			{text || 'Checkbox Item'}
		{/if}
	{/snippet}
</DropdownMenu.CheckboxItem>
