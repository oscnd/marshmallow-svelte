<script lang="ts">
	import SelectRoot from './SelectRoot.svelte'
	import SelectTrigger from './SelectTrigger.svelte'
	import SelectPortal from './SelectPortal.svelte'
	import SelectContent from './SelectContent.svelte'
	import SelectViewport from './SelectViewport.svelte'
	import SelectItem from './SelectItem.svelte'
	import { ChevronDown, Check } from '@lucide/svelte'
	import type { Props as SelectRootProps } from './SelectRoot.svelte'
	import type { Snippet } from 'svelte'
	import { Select } from 'bits-ui'

	export type Option = {
		value: string
		label: string
		disabled?: boolean
	}

	export type Props = SelectRootProps & {
		options: Option[]
		placeholder?: string
		class?: string
		contentClass?: string
		triggerClass?: string
		children?: Snippet
	}

	let {
		options,
		placeholder = 'Select an option...',
		class: className,
		contentClass,
		triggerClass,
		children,
		value = $bindable(),
		...props
	}: Props = $props()

	const selectedLabel = $derived(
		typeof value === 'string'
			? options.find((option) => option.value === value)?.label || placeholder
			: options
					.filter((option) => value?.includes(option.value))
					.map((option) => option.label)
					.join(', ') || placeholder
	)
</script>

<SelectRoot {...props} class={className} bind:value>
	<SelectTrigger class={triggerClass}>
		<span class:selectedLabel class={value ? '' : 'text-gray-500'}>
			{selectedLabel}
		</span>
		<ChevronDown class="h-4 w-4 shrink-0 opacity-50" />
	</SelectTrigger>
	<SelectPortal>
		<SelectContent class={contentClass} sideOffset={10}>
			<SelectViewport>
				{#each options as option, i (i + option.value)}
					<SelectItem value={option.value} disabled={option.disabled}>
						{#snippet children({ selected, highlighted })}
							<span class="absolute left-2 flex h-3.5 w-3.5 items-center justify-center">
								{#if selected}
									<Check class="h-4 w-4" />
								{/if}
							</span>
							{option.label}
						{/snippet}
					</SelectItem>
				{:else}
					<span class="px-2 py-1.5 text-sm text-gray-500">No options available</span>
				{/each}
			</SelectViewport>
		</SelectContent>
	</SelectPortal>
	{#if children}
		{@render children()}
	{/if}
</SelectRoot>
