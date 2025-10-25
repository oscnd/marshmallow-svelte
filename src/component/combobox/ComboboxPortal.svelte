<script lang="ts">
	import { Combobox as BitsCombobox, type ComboboxPortalProps } from 'bits-ui'
	import { cn } from '$/lib/utils'

	export type Props = ComboboxPortalProps & {
		class?: string
	}

	const { class: className, children, ...props }: Props = $props()

	const classes = $derived(cn(className))
</script>

<BitsCombobox.Portal {...props}>
	{#if children}
		{@render children()}
	{/if}
</BitsCombobox.Portal>
