<script lang="ts">
	import { Select, type SelectTriggerProps } from 'bits-ui'
	import { cn } from '$/lib/utils'
	import { ChevronDown } from '@lucide/svelte'

	export type Props = SelectTriggerProps & {
		class?: string
	}

	const { class: className, children, ...props }: Props = $props()
</script>

<Select.Trigger
	class={cn(
		'flex h-10 w-full items-center justify-between rounded-md border border-gray-200 bg-white px-3 py-2 text-sm ring-offset-white placeholder:text-gray-500 focus-visible:ring-2 focus-visible:ring-gray-900 focus-visible:ring-offset-2 focus-visible:outline-none disabled:cursor-not-allowed disabled:opacity-50',
		className
	)}
	{...props}
>
	{#if children}
		{@render children()}
	{:else}
		<ChevronDown class="h-4 w-4 text-gray-500" />
	{/if}
</Select.Trigger>
