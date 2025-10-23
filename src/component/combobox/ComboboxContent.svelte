<script lang="ts">
	import { ChevronUp, ChevronDown } from '@lucide/svelte'
	import { Combobox } from 'bits-ui'
	import { cn } from '../../lib/utils.js'

	export type Props = {
		class?: string
		children?: any
		sideOffset?: number
		showScrollButtons?: boolean
	} & Combobox.ContentProps

	let { class: className, children, sideOffset = 4, showScrollButtons = true, ...props }: Props = $props()

	const classes = $derived(
		cn(
			'relative z-50 min-w-[8rem] overflow-hidden rounded-md border bg-popover text-popover-foreground shadow-md data-[state=open]:animate-in data-[state=closed]:animate-out data-[state=closed]:fade-out-0 data-[state=open]:fade-in-0 data-[state=closed]:zoom-out-95 data-[state=open]:zoom-in-95 data-[side=bottom]:slide-in-from-top-2 data-[side=left]:slide-in-from-right-2 data-[side=right]:slide-in-from-left-2 data-[side=top]:slide-in-from-bottom-2 p-1',
			className
		)
	)
</script>

<Combobox.Content class={classes} {sideOffset} {...props}>
	{#if showScrollButtons}
		<Combobox.ScrollUpButton class="flex w-full items-center justify-center py-1">
			<ChevronUp class="h-4 w-4" />
		</Combobox.ScrollUpButton>
	{/if}

	{#if children}
		{@render children()}
	{/if}

	{#if showScrollButtons}
		<Combobox.ScrollDownButton class="flex w-full items-center justify-center py-1">
			<ChevronDown class="h-4 w-4" />
		</Combobox.ScrollDownButton>
	{/if}
</Combobox.Content>
