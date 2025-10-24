<script lang="ts">
	import { Tabs as TabsPrimitive } from 'bits-ui'
	import { cn } from '$/lib/utils'
	import type { Snippet } from 'svelte'
	import type { TabsTriggerProps } from 'bits-ui'

	export type Props = TabsTriggerProps & {
		/** Additional classes for the tabs trigger */
		class?: string
		/** Tabs trigger content */
		children: Snippet
	}

	const { class: className, children, ...props }: Props = $props()

	const classes = $derived(
		cn(
			'inline-flex items-center justify-center whitespace-nowrap rounded-sm px-3 py-1.5 text-sm font-medium ring-offset-background transition-all focus-visible:outline-hidden focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 data-[state=active]:bg-background data-[state=active]:text-foreground data-[state=active]:shadow-sm',
			className
		)
	)
</script>

<TabsPrimitive.Trigger {...props} class={classes}>
	{@render children()}
</TabsPrimitive.Trigger>