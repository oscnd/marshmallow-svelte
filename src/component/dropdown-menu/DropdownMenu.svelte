<script lang="ts">
	import DropdownMenuRoot from './DropdownMenuRoot.svelte'
	import DropdownMenuTrigger from './DropdownMenuTrigger.svelte'
	import DropdownMenuPortal from './DropdownMenuPortal.svelte'
	import DropdownMenuContent from './DropdownMenuContent.svelte'
	import DropdownMenuItem from './DropdownMenuItem.svelte'
	import DropdownMenuCheckboxItem from './DropdownMenuCheckboxItem.svelte'
	import DropdownMenuRadioGroup from './DropdownMenuRadioGroup.svelte'
	import DropdownMenuRadioItem from './DropdownMenuRadioItem.svelte'
	import DropdownMenuSub from './DropdownMenuSub.svelte'
	import DropdownMenuSubTrigger from './DropdownMenuSubTrigger.svelte'
	import DropdownMenuSubContent from './DropdownMenuSubContent.svelte'
	import DropdownMenuSeparator from './DropdownMenuSeparator.svelte'
	import { MoreHorizontal } from '@lucide/svelte'
	import type { Props as DropdownMenuRootProps } from './DropdownMenuRoot.svelte'
	import type { Snippet } from 'svelte'

	type MenuItem = {
		label: string
		value: string
		disabled?: boolean
		type?: 'item' | 'checkbox' | 'radio' | 'separator' | 'label'
		children?: MenuItem[]
	}

	type CheckboxState = Record<string, boolean>

	type Props = DropdownMenuRootProps & {
		items?: MenuItem[]
		trigger?: Snippet
		class?: string
		contentClass?: string
		triggerClass?: string
		children?: Snippet
		radioValue?: string
		checkboxStates?: CheckboxState
	}

	let {
		items,
		trigger,
		class: className,
		contentClass,
		triggerClass,
		children,
		open = $bindable(false),
		radioValue = $bindable(''),
		checkboxStates = $bindable({
			...items?.reduce((acc, item) => {
				if (item.type === 'checkbox') {
					acc[item.label] = false
				}
				return acc
			}, {} as CheckboxState),
		} as CheckboxState),
		...props
	}: Props = $props()

	// Set default radio value to first radio item if no value is provided
	$effect(() => {
		if (!radioValue && items) {
			const firstRadioItem = items.find((item) => item.type === 'radio' && item.value)
			if (firstRadioItem?.value) {
				radioValue = firstRadioItem.value
			}
		}
	})

	const handleItemClick = (item: MenuItem) => {
		if (item.type === 'item' && !item.disabled) {
			// Custom logic can be added here
		}
	}

	const handleCheckboxChange = (item: MenuItem, checked: boolean) => {
		const key = item.label
		checkboxStates[key] = checked
	}

	const groupRadioItems = (items: MenuItem[], startIndex: number): { end: number; items: MenuItem[] } => {
		const radioItems: MenuItem[] = []
		let i = startIndex

		while (i < items.length && items[i]?.type === 'radio' && items[i]?.value) {
			radioItems.push(items[i]!)
			i++
		}

		return { end: i - 1, items: radioItems }
	}
</script>

<DropdownMenuRoot {...props} class={className} bind:open>
	<DropdownMenuTrigger class={triggerClass}>
		{#if trigger}
			{@render trigger()}
		{:else}
			<MoreHorizontal class="h-4 w-4" />
		{/if}
	</DropdownMenuTrigger>
	<DropdownMenuPortal>
		<DropdownMenuContent class={contentClass} sideOffset={10}>
			{#if children}
				{@render children()}
			{:else if items}
				{#each items as item, i (i + (item.label || item.value || ''))}
					{#if item.type === 'separator'}
						<DropdownMenuSeparator />
					{:else if item.type === 'label'}
						<div class="px-2 py-1.5 text-sm font-semibold">{item.label}</div>
					{:else if item.type === 'checkbox'}
						<DropdownMenuCheckboxItem
							disabled={item.disabled}
							text={item.label}
							bind:checked={checkboxStates[item.label]}
						/>
					{:else if item.type === 'radio' && item.value}
						{#if i === 0 || items[i - 1]?.type !== 'radio'}
							{@const radioGroup = groupRadioItems(items, i)}
							<DropdownMenuRadioGroup bind:value={radioValue}>
								{#each radioGroup.items as radioItem, j (j + (radioItem.label || radioItem.value || ''))}
									<DropdownMenuRadioItem
										value={radioItem.value!}
										disabled={radioItem.disabled}
										text={radioItem.label}
									/>
								{/each}
							</DropdownMenuRadioGroup>
						{/if}
					{:else if item.children && item.children.length > 0}
						<DropdownMenuSub>
							<DropdownMenuSubTrigger disabled={item.disabled}>
								{item.label}
							</DropdownMenuSubTrigger>
							<DropdownMenuSubContent>
								{#each item.children as childItem, j (j + (childItem.label || childItem.value || ''))}
									{#if childItem.type === 'separator'}
										<DropdownMenuSeparator />
									{:else if childItem.type === 'label'}
										<div class="px-2 py-1.5 text-sm font-semibold">{childItem.label}</div>
									{:else if childItem.type === 'checkbox'}
										<DropdownMenuCheckboxItem
											disabled={childItem.disabled}
											text={childItem.label}
											bind:checked={checkboxStates[childItem.label]}
										/>
									{:else if childItem.type === 'radio' && childItem.value}
										{#if j === 0 || item.children[j - 1]?.type !== 'radio'}
											{@const childRadioGroup = groupRadioItems(item.children, j)}
											<DropdownMenuRadioGroup bind:value={radioValue}>
												{#each childRadioGroup.items as childRadioItem, k (k + (childRadioItem.label || childRadioItem.value || ''))}
													<DropdownMenuRadioItem
														value={childRadioItem.value}
														disabled={childRadioItem.disabled}
														text={childRadioItem.label}
													/>
												{/each}
											</DropdownMenuRadioGroup>
										{/if}
									{:else}
										<DropdownMenuItem
											disabled={childItem.disabled}
											onclick={() => handleItemClick(childItem)}
										>
											{childItem.label}
										</DropdownMenuItem>
									{/if}
								{/each}
							</DropdownMenuSubContent>
						</DropdownMenuSub>
					{:else}
						<DropdownMenuItem disabled={item.disabled} onclick={() => handleItemClick(item)}>
							{item.label}
						</DropdownMenuItem>
					{/if}
				{/each}
			{/if}
		</DropdownMenuContent>
	</DropdownMenuPortal>
</DropdownMenuRoot>
