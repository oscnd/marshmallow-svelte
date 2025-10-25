<script lang="ts">
	import TabsRoot from './TabsRoot.svelte'
	import TabsList from './TabsList.svelte'
	import TabsTrigger from './TabsTrigger.svelte'
	import TabsContent from './TabsContent.svelte'
	import type { Props as TabsRootProps } from './TabsRoot.svelte'
	import type { Snippet } from 'svelte'
	import { cn } from '$/lib/utils.ts'

	export type Tab = {
		value: string
		label: string
		content: Snippet
		disabled?: boolean
	}

	export type Props = TabsRootProps & {
		/** Array of tabs to display */
		tabs: Tab[]
		/** Additional classes for the tabs root */
		class?: string
		/** Additional classes for the tabs list */
		listClass?: string
		/** Additional classes for tab triggers */
		triggerClass?: string
		/** Additional classes for tab content */
		contentClass?: string
	}

	let {
		tabs,
		class: className,
		listClass,
		triggerClass,
		contentClass,
		value = $bindable(),
		...props
	}: Props = $props()

	const classes = $derived(cn(className))
</script>

<TabsRoot {...props} class={className} bind:value>
	<TabsList class={listClass}>
		{#each tabs as tab (tab.value)}
			<TabsTrigger value={tab.value} class={triggerClass} disabled={tab.disabled}>
				{tab.label}
			</TabsTrigger>
		{/each}
	</TabsList>

	{#each tabs as tab (tab.value)}
		<TabsContent value={tab.value} class={contentClass}>
			{@render tab.content()}
		</TabsContent>
	{/each}
</TabsRoot>
