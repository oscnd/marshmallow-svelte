<script lang="ts">
	import '$/style/tailwind.css'
	import { DropdownMenu, type DropdownMenuContentProps } from 'bits-ui'
	import { cn } from '$/lib/utils'

	export type Props = DropdownMenuContentProps & {
		class?: string
	}

	let { class: className, children, ...props }: Props = $props()

	const classes = $derived(
		cn(
			'data-[state=open]:animate-in data-[state=closed]:animate-out data-[state=closed]:fade-out-0 data-[state=open]:fade-in-0 data-[state=closed]:zoom-out-95 data-[state=open]:zoom-in-95 data-[side=bottom]:slide-in-from-top-2 data-[side=left]:slide-in-from-right-2 data-[side=right]:slide-in-from-left-2 data-[side=top]:slide-in-from-bottom-2 relative z-50 min-w-[8rem] overflow-hidden rounded-md border border-gray-200 bg-white p-1 text-gray-900 shadow-md data-[state=open]:block',
			className
		)
	)
</script>

<DropdownMenu.Content {...props} class={classes}>
	{#if children}
		{@render children()}
	{/if}
</DropdownMenu.Content>
