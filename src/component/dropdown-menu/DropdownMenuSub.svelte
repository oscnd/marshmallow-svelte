<script lang="ts">
	import { DropdownMenu, type DropdownMenuSubProps } from 'bits-ui'
	import { cn } from '$/lib/utils'

	export type Props = DropdownMenuSubProps & {
		class?: string
	}

	let { class: className, children, ...props }: Props = $props()
</script>

<DropdownMenu.Sub {...props}>
	{#if children}
		{@render children()}
	{/if}
</DropdownMenu.Sub>
