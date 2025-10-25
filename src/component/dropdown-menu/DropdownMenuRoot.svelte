<script lang="ts">
	import '$/style/tailwind.css'
	import { DropdownMenu, type DropdownMenuRootProps } from 'bits-ui'
	import { cn } from '$/lib/utils'

	export type Props = DropdownMenuRootProps & {
		class?: string
		open?: boolean
	}

	let { class: className, children, open = $bindable(false), ...props }: Props = $props()
</script>

<DropdownMenu.Root {...props} bind:open>
	{#if children}
		{@render children()}
	{/if}
</DropdownMenu.Root>
