<script lang="ts">
    import ComboboxRoot from './ComboboxRoot.svelte'
    import ComboboxTrigger from './ComboboxTrigger.svelte'
    import ComboboxInput from './ComboboxInput.svelte'
    import ComboboxPortal from './ComboboxPortal.svelte'
    import ComboboxContent from './ComboboxContent.svelte'
    import ComboboxViewport from './ComboboxViewport.svelte'
    import ComboboxItem from './ComboboxItem.svelte'
    import {Search, Check} from '@lucide/svelte'
    import type {Props as ComboboxRootProps} from './ComboboxRoot.svelte'
    import type {Snippet} from 'svelte'
    import {Combobox} from 'bits-ui'

    export type Option = {
        value: string
        label: string
        disabled?: boolean
    }

    export type Props = ComboboxRootProps & {
        options: Option[]
        placeholder?: string
        class?: string
        contentClass?: string
        triggerClass?: string
        inputClass?: string
        children?: Snippet
    }

    let {
        options,
        placeholder = 'Search...',
        class: className,
        contentClass,
        triggerClass,
        inputClass,
        children,
        value = $bindable(),
        ...props
    }: Props = $props()

    let searchValue = $state('')

    const filteredOptions = $derived(
        searchValue === ''
            ? options
            : options.filter((option) => option.label.toLowerCase().includes(searchValue.toLowerCase()))
    )
</script>

<ComboboxRoot {...props} class={className} items={options} bind:value>
    <div class="relative">
        <Search class="absolute top-1/2 left-3 h-4 w-4 -translate-y-1/2 text-gray-500"/>
        <ComboboxInput class={inputClass} oninput={(e) => (searchValue = e.currentTarget.value)} {placeholder}/>
        <ComboboxTrigger class={triggerClass}/>
    </div>
    <ComboboxPortal>
        <ComboboxContent class={contentClass} sideOffset={10}>
            <ComboboxViewport>
                {#each filteredOptions as option, i (i + option.value)}
                    <ComboboxItem value={option.value} label={option.label} disabled={option.disabled}>
                        {#snippet children({selected, highlighted})}
							<span class="absolute left-2 flex h-3.5 w-3.5 items-center justify-center">
								{#if selected}
									<Check class="h-4 w-4"/>
								{/if}
							</span>
                            {option.label}
                        {/snippet}
                    </ComboboxItem>
                {:else}
                    <span class="px-2 py-1.5 text-sm text-gray-500">No results found</span>
                {/each}
            </ComboboxViewport>
        </ComboboxContent>
    </ComboboxPortal>
    {#if children}
        {@render children()}
    {/if}
</ComboboxRoot>
