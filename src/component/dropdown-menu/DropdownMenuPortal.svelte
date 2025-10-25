<script lang="ts">
	import { DropdownMenu, type DropdownMenuPortalProps } from 'bits-ui'
	import { cn } from '$/lib/utils'

	export type Props = DropdownMenuPortalProps & {
		class?: string
	}

	let { class: className, children, ...props }: Props = $props()
</script>

<DropdownMenu.Portal {...props}>
	{#if children}
		{@render children()}
	{/if}
</DropdownMenu.Portal>
