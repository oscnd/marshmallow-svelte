<script lang="ts">
	import { Combobox } from 'bits-ui'

	export type Props = {
		children?: any
		forceMount?: boolean
		container?: HTMLElement | string
	} & Combobox.PortalProps

	let { children, forceMount, container, ...props }: Props = $props()
</script>

<Combobox.Portal {...props}>
	{#if children}
		{@render children()}
	{/if}
</Combobox.Portal>