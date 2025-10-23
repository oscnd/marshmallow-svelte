<script lang="ts">
	import '../../style/tailwind.css'
	import { Combobox } from 'bits-ui'
	import { cn } from '../../lib/utils.js'
	import type { Snippet } from 'svelte'

	export type Props = {
		class?: string
		children?: Snippet
		type: 'single' | 'multiple'
		name?: string
		disabled?: boolean
		value?: string | string[]
		onValueChange?: (value: string | string[]) => void
		onOpenChangeComplete?: (open: boolean) => void
	}

	let {
		class: className,
		children,
		type,
		name,
		disabled,
		value,
		onValueChange,
		onOpenChangeComplete,
		...props
	}: Props = $props()

	const classes = $derived(cn('relative w-full', className))
</script>

<div class={classes}>
	{#if type === 'multiple'}
		<Combobox.Root
			type="multiple"
			{name}
			{disabled}
			value={Array.isArray(value) ? value : []}
			{onValueChange}
			{onOpenChangeComplete}
			{...props}
		>
			{#if children}
				{@render children()}
			{/if}
		</Combobox.Root>
	{:else}
		<Combobox.Root
			type="single"
			{name}
			{disabled}
			value={Array.isArray(value) ? value[0] || '' : value}
			{onValueChange}
			{onOpenChangeComplete}
			{...props}
		>
			{#if children}
				{@render children()}
			{/if}
		</Combobox.Root>
	{/if}
</div>
