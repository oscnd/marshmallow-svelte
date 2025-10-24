<script lang="ts">
	import '$/style/tailwind.css'
	import { Select, type SelectRootProps } from 'bits-ui'
	import { cn } from '$/lib/utils'

	export type Props = SelectRootProps & {
		class?: string
		value?: any
	}

	let { class: className, children, value = $bindable(), ...props }: Props = $props()
</script>

<Select.Root {...props} bind:value>
	{#if children}
		{@render children()}
	{/if}
</Select.Root>