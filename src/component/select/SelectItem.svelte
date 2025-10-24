<script lang="ts">
	import '$/style/tailwind.css'
	import { Select, type SelectItemProps } from 'bits-ui'
	import { cn } from '$/lib/utils'
	import type { Snippet } from 'svelte'
	import { Check } from '@lucide/svelte'

	export type Props = SelectItemProps & {
		children?: Snippet<[{ selected: boolean; highlighted: boolean }]>
		class?: string
	}

	const { class: className, children, ...props }: Props = $props()

	const classes = $derived(
		cn(
			'relative flex w-full cursor-default select-none items-center rounded-sm py-1.5 pl-8 pr-2 text-sm outline-none focus:bg-accent focus:text-accent-foreground data-[disabled]:pointer-events-none data-[disabled]:opacity-50',
			className
		)
	)
</script>

<Select.Item {...props} class={classes}>
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
</Select.Item>