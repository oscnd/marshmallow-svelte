<script lang="ts">
	import '$/style/tailwind.css'
	import { Combobox as BitsCombobox, type ComboboxRootProps } from 'bits-ui'
	import { cn } from '$/lib/utils'

	export type Props = ComboboxRootProps & {
		class?: string
	}

	const { class: className, children, ...props }: Props = $props()
</script>

<BitsCombobox.Root {...props}>
	{#if children}
		{@render children()}
	{/if}
</BitsCombobox.Root>
