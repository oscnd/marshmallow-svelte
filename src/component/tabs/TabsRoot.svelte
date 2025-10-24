<script lang="ts">
	import { Tabs as TabsPrimitive } from 'bits-ui'
	import type { Snippet } from 'svelte'
	import type { TabsRootProps } from 'bits-ui'

	export type Props = TabsRootProps & {
		/** Additional classes for the tabs */
		class?: string
	}

	let { class: className, children, value = $bindable(), ...props }: Props = $props()
</script>

<TabsPrimitive.Root {...props} bind:value class={className}>
	{#if children}
		{@render children()}
	{/if}
</TabsPrimitive.Root>