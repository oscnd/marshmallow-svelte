<script lang="ts">
	import '$/style/tailwind.css'
	import { Combobox as BitsCombobox, type ComboboxItemProps } from 'bits-ui'
	import { cn } from '$/lib/utils'
	import { Check } from '@lucide/svelte'
	import type { Snippet } from 'svelte'

	export type Props = ComboboxItemProps & {
		children?: Snippet<{ selected: boolean; highlighted: boolean }[]>
		class?: string
	}

	const { class: className, children, ...props }: Props = $props()

	const classes = $derived(
		cn(
			'relative flex w-full cursor-default items-center rounded-sm py-1.5 pr-2 pl-8 text-sm outline-none select-none hover:bg-gray-100 focus:bg-gray-100 data-[disabled]:pointer-events-none data-[disabled]:opacity-50',
			className
		)
	)
</script>

<BitsCombobox.Item {...props} class={classes}>
	{#snippet children({ selected, highlighted })}
		{#if children}
			{@render children({ selected, highlighted })}
		{:else}
			<span class="absolute left-2 flex h-3.5 w-3.5 items-center justify-center">
				{#if selected}
					<Check class="h-4 w-4" />
				{/if}
			</span>
			{props.label || props.value}
		{/if}
	{/snippet}
</BitsCombobox.Item>
