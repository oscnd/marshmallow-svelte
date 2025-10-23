<script lang="ts">
	import '$/style/tailwind.css'
	import { Combobox as BitsCombobox, type ComboboxViewportProps } from 'bits-ui'
	import { cn } from '$/lib/utils'
	import { ChevronUp, ChevronDown } from '@lucide/svelte'

	export type Props = ComboboxViewportProps & {
		class?: string
	}

	const { class: className, children, ...props }: Props = $props()

	const viewportClasses = $derived(cn('p-1', className))
</script>

<BitsCombobox.ScrollUpButton class="flex h-6 w-full items-center justify-center">
	<ChevronUp class="h-4 w-4" />
</BitsCombobox.ScrollUpButton>

<BitsCombobox.Viewport {...props} class={viewportClasses}>
	{#if children}
		{@render children()}
	{/if}
</BitsCombobox.Viewport>

<BitsCombobox.ScrollDownButton class="flex h-6 w-full items-center justify-center">
	<ChevronDown class="h-4 w-4" />
</BitsCombobox.ScrollDownButton>
