<script lang="ts">
	import { DropdownMenu, type DropdownMenuTriggerProps } from 'bits-ui'
	import { cn } from '$/lib/utils'

	export type Props = DropdownMenuTriggerProps & {
		class?: string
	}

	let { class: className, children, ...props }: Props = $props()
</script>

<DropdownMenu.Trigger
	class={cn(
		'ring-offset-background focus-visible:ring-ring data-[state=open]:bg-accent data-[state=open]:text-accent-foreground inline-flex items-center justify-center rounded-md text-sm font-medium transition-colors focus-visible:ring-2 focus-visible:ring-offset-2 focus-visible:outline-none disabled:pointer-events-none disabled:opacity-50',
		className
	)}
	{...props}
>
	{#if children}
		{@render children()}
	{/if}
</DropdownMenu.Trigger>
