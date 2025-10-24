<script lang="ts">
	import '$/style/tailwind.css'
	import { Combobox as BitsCombobox, type ComboboxTriggerProps } from 'bits-ui'
	import { cn } from '$/lib/utils'
	import { ChevronDown } from '@lucide/svelte'

	export type Props = ComboboxTriggerProps & {
		class?: string
	}

	const { class: className, children, ...props }: Props = $props()

	const classes = $derived(cn('absolute top-1/2 right-3 h-4 w-4 -translate-y-1/2', className))
</script>

<BitsCombobox.Trigger {...props} class={classes} aria-label="Combobox Trigger">
	{#if children}
		{@render children()}
	{:else}
		<ChevronDown class="h-4 w-4 text-gray-500" />
	{/if}
</BitsCombobox.Trigger>
