<script lang="ts">
	import { Check } from '@lucide/svelte'
	import { Combobox } from 'bits-ui'
	import { cn } from '../../lib/utils.js'

	export type Props = {
		value: string
		label: string
		selected?: boolean
		class?: string
		disabled?: boolean
	} & Omit<Combobox.ItemProps, 'value' | 'children'>

	let { value, label, selected = false, class: className, disabled = false, ...props }: Props = $props()

	const classes = $derived(
		cn(
			'relative flex w-full cursor-default select-none items-center rounded-sm py-1.5 pl-8 pr-2 text-sm outline-none hover:bg-accent hover:text-accent-foreground focus:bg-accent focus:text-accent-foreground data-[disabled]:pointer-events-none data-[disabled]:opacity-50',
			className
		)
	)
</script>

<Combobox.Item class={classes} {value} {disabled} {...props}>
	<span class="absolute left-2 flex h-3.5 w-3.5 items-center justify-center">
		{#if selected}
			<Check class="h-4 w-4" />
		{/if}
	</span>
	<span class="truncate">{label}</span>
</Combobox.Item>
