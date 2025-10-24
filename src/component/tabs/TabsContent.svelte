<script lang="ts">
	import { Tabs as TabsPrimitive } from 'bits-ui'
	import { cn } from '$/lib/utils'
	import type { Snippet } from 'svelte'
	import type { TabsContentProps } from 'bits-ui'

	export type Props = TabsContentProps & {
		/** Additional classes for the tabs content */
		class?: string
		/** Tabs content */
		children: Snippet
	}

	const { class: className, children, ...props }: Props = $props()

	const classes = $derived(
		cn(
			'mt-2 ring-offset-background focus-visible:outline-hidden focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2',
			className
		)
	)
</script>

<TabsPrimitive.Content {...props} class={classes}>
	{@render children()}
</TabsPrimitive.Content>