<script lang="ts">
	import '$/style/tailwind.css'
	import { Combobox as BitsCombobox, type ComboboxRootProps } from 'bits-ui'
	import { cn } from '$/lib/utils'

	export type Props = ComboboxRootProps & {
		class?: string
        value?: any
	}

	let { class: className, children, value = $bindable(), ...props }: Props = $props()
</script>

<BitsCombobox.Root {...props} bind:value>
	{#if children}
		{@render children()}
	{/if}
</BitsCombobox.Root>
