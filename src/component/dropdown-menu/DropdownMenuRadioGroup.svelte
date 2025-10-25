<script lang="ts">
	import { DropdownMenu, type DropdownMenuRadioGroupProps } from 'bits-ui'
	import { cn } from '$/lib/utils'

	export type Props = DropdownMenuRadioGroupProps & {
		class?: string
		value?: string
	}

	let { class: className, children, value = $bindable(), ...props }: Props = $props()
</script>

<DropdownMenu.RadioGroup {...props} bind:value class={className}>
	{#if children}
		{@render children()}
	{/if}
</DropdownMenu.RadioGroup>
