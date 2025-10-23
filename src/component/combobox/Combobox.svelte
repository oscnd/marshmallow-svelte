<script lang="ts">
  import ComboboxRoot from './ComboboxRoot.svelte'
  import ComboboxInput from './ComboboxInput.svelte'
  import ComboboxTrigger from './ComboboxTrigger.svelte'
  import ComboboxPortal from './ComboboxPortal.svelte'
  import ComboboxContent from './ComboboxContent.svelte'
  import ComboboxViewport from './ComboboxViewport.svelte'
  import ComboboxItem from './ComboboxItem.svelte'
  import { cn } from '../../lib/utils.js'
  import type { Snippet } from 'svelte'

  export type Option = {
    value: string
    label: string
    disabled?: boolean
  }

  export type Props = {
    options: Option[]
    placeholder?: string
		searchPlaceholder?: string
		class?: string
		contentClass?: string
		triggerClass?: string
		inputClass?: string
		disabled?: boolean
		type?: 'single' | 'multiple'
		name?: string
		value?: string | string[]
		onValueChange?: (value: string | string[]) => void
		allowCustom?: boolean
		children?: Snippet
	}

  let {
		options,
		placeholder = 'Select an option...',
		searchPlaceholder = 'Search...',
		class: className,
		contentClass,
		triggerClass,
		inputClass,
		disabled = false,
		type = 'single',
		name,
		value = $bindable(''),
		onValueChange,
		allowCustom = false,
		children,
	}: Props = $props()

	let searchValue = $state('')
	let openState = $state(false)

	const filteredOptions = $derived(
		searchValue === ''
			? options
			: options.filter((option) =>
					option.label.toLowerCase().includes(searchValue.toLowerCase())
				)
	)

	const containerClasses = $derived(cn('relative w-full', className))

	const selectedValues = $derived.by(() => {
		if (type === 'single') {
			return typeof value === 'string' && value ? [value] : []
		}
		return Array.isArray(value) ? value : []
	})

	const displayValue = $derived.by(() => {
		if (type === 'single') {
			const selected = options.find(opt => opt.value === value)
			return selected?.label || value || placeholder
		}

		if (type === 'multiple' && Array.isArray(value)) {
			const selected = options.filter(opt => value.includes(opt.value))
			if (selected.length === 0) return placeholder
			if (selected.length === 1) return selected[0]?.label || placeholder
			return `${selected.length} items selected`
		}

		return placeholder
	})

	const handleValueChange = (newValue: string | string[]) => {
		if (type === 'single') {
			value = Array.isArray(newValue) ? newValue[0] || '' : newValue
		} else {
			value = Array.isArray(newValue) ? newValue : [newValue].filter(Boolean)
		}
		onValueChange?.(value)
	}
</script>

<ComboboxRoot
	class={containerClasses}
	type={type}
	name={name}
	disabled={disabled}
	value={selectedValues}
	onValueChange={handleValueChange}
>
	{#if children}
		{@render children()}
	{:else}
		<ComboboxTrigger class={triggerClass}>
			{displayValue}
		</ComboboxTrigger>

		<ComboboxPortal>
			<ComboboxContent class={contentClass} sideOffset={4}>
				<ComboboxInput
					placeholder={searchPlaceholder}
					showSearchIcon={true}
					class={inputClass}
					oninput={(e) => {
				if (e.currentTarget) {
					searchValue = e.currentTarget.value
				}
			}}
				/>

				<ComboboxViewport>
					{#each filteredOptions as option}
						<ComboboxItem
							value={option.value}
							label={option.label}
							selected={selectedValues.includes(option.value)}
							disabled={option.disabled}
						/>
					{:else}
						<div class="py-6 text-center text-sm text-muted-foreground">
							No results found.
						</div>
					{/each}
				</ComboboxViewport>
			</ComboboxContent>
		</ComboboxPortal>
	{/if}
</ComboboxRoot>