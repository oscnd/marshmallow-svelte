<script lang="ts">
    import {Combobox} from 'bits-ui'
    import {ChevronDown, Check, Search, ChevronUp, ChevronDown as ChevronDownIcon} from '@lucide/svelte'
    import type {Snippet} from 'svelte'

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
        children,
    }: Props = $props()

    let searchValue = $state('')

    const filteredOptions = $derived(
        searchValue === ''
            ? options
            : options.filter((option) => option.label.toLowerCase().includes(searchValue.toLowerCase()))
    )
</script>

<Combobox.Root
        {name}
        onOpenChangeComplete={(o) => {
		if (!o) searchValue = ''
	}}
        type="multiple"
>
    <div class="relative">
        <Search class="absolute top-1/2 left-3 h-4 w-4 -translate-y-1/2 text-gray-500"/>
        <Combobox.Input
                aria-label="Search a fruit"
                class="flex h-10 w-full rounded-md border border-gray-200 bg-white px-10 py-2 text-sm ring-offset-white file:border-0 file:bg-transparent file:text-sm file:font-medium placeholder:text-gray-500 focus-visible:ring-2 focus-visible:ring-gray-900 focus-visible:ring-offset-2 focus-visible:outline-none disabled:cursor-not-allowed disabled:opacity-50"
                oninput={(e) => (searchValue = e.currentTarget.value)}
                placeholder={searchPlaceholder}
        />
        <Combobox.Trigger class="absolute top-1/2 right-3 h-4 w-4 -translate-y-1/2">
            <ChevronDown class="h-4 w-4 text-gray-500"/>
        </Combobox.Trigger>
    </div>
    <Combobox.Portal>
        <Combobox.Content
                class="data-[state=open]:animate-in data-[state=closed]:animate-out data-[state=closed]:fade-out-0 data-[state=open]:fade-in-0 data-[state=closed]:zoom-out-95 data-[state=open]:zoom-in-95 data-[side=bottom]:slide-in-from-top-2 data-[side=left]:slide-in-from-right-2 data-[side=right]:slide-in-from-left-2 data-[side=top]:slide-in-from-bottom-2 relative z-50 w-[var(--bits-floating-anchor-width,100%)] overflow-hidden rounded-md border border-gray-200 bg-white text-gray-900 shadow-md"
                sideOffset={10}
        >
            <Combobox.ScrollUpButton class="flex h-6 w-full items-center justify-center">
                <ChevronUp class="h-4 w-4"/>
            </Combobox.ScrollUpButton>
            <Combobox.Viewport class="p-1">
                {#each filteredOptions as option, i (i + option.value)}
                    <Combobox.Item
                            class="relative flex w-full cursor-default items-center rounded-sm py-1.5 pr-2 pl-8 text-sm outline-none select-none hover:bg-gray-100 focus:bg-gray-100 data-[disabled]:pointer-events-none data-[disabled]:opacity-50"
                            value={option.value}
                            label={option.label}
                    >
                        {#snippet children({selected})}
							<span class="absolute left-2 flex h-3.5 w-3.5 items-center justify-center">
								{#if selected}
									<Check class="h-4 w-4"/>
								{/if}
							</span>
                            {option.label}
                        {/snippet}
                    </Combobox.Item>
                {:else}
                    <span class="px-2 py-1.5 text-sm text-gray-500"> No results found. </span>
                {/each}
            </Combobox.Viewport>
            <Combobox.ScrollDownButton class="flex h-6 w-full items-center justify-center">
                <ChevronDownIcon class="h-4 w-4"/>
            </Combobox.ScrollDownButton>
        </Combobox.Content>
    </Combobox.Portal>
</Combobox.Root>
