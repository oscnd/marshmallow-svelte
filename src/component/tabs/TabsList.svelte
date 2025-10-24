<script lang="ts">
	import { Tabs as TabsPrimitive } from 'bits-ui'
	import { cn } from '$/lib/utils'
	import type { Snippet } from 'svelte'
	import type { TabsListProps } from 'bits-ui'

	export type Props = TabsListProps & {
		/** Additional classes for the tabs list */
		class?: string
		/** Tabs list content */
		children: Snippet
	}

	const { class: className, children, ...props }: Props = $props()

	const classes = $derived(
		cn(
			'inline-flex h-10 items-center justify-center rounded-md bg-muted p-1 text-muted-foreground',
			className
		)
	)
</script>

<TabsPrimitive.List {...props} class={classes}>
	{@render children()}
</TabsPrimitive.List>