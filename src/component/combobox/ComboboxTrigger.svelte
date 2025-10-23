<script lang="ts">
	import { ChevronDown } from '@lucide/svelte'
	import { Combobox } from 'bits-ui'
	import { cn } from '../../lib/utils.js'

	export type Props = {
		class?: string
		children?: any
	} & Combobox.TriggerProps

	let { class: className, children, ...props }: Props = $props()

	const classes = $derived(
		cn(
			'flex h-10 w-full items-center justify-between rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background placeholder:text-muted-foreground focus:outline-none focus:ring-2 focus:ring-ring focus:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50',
			className
		)
	)
</script>

<Combobox.Trigger class={classes} {...props}>
	{#if children}
		{@render children()}
	{:else}
		<span class="block truncate">Select an option...</span>
	{/if}
	<ChevronDown class="h-4 w-4 opacity-50" />
</Combobox.Trigger>
