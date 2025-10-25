<script lang="ts">
	import '$/style/tailwind.css'
	import { DropdownMenu, type DropdownMenuSubTriggerProps } from 'bits-ui'
	import { cn } from '$/lib/utils'
	import { ChevronRight } from '@lucide/svelte'

	export type Props = DropdownMenuSubTriggerProps & {
		class?: string
	}

	const { class: className, children, ...props }: Props = $props()

	const classes = $derived(
		cn(
			'flex cursor-default select-none items-center rounded-sm px-2 py-1.5 text-sm outline-none focus:bg-gray-100 data-[state=open]:bg-gray-100',
			className
		)
	)
</script>

<DropdownMenu.SubTrigger {...props} class={classes}>
	{#if children}
		{@render children()}
	{/if}
	<ChevronRight class="ml-auto h-4 w-4" />
</DropdownMenu.SubTrigger>
