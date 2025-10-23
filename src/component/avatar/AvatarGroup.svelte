<script lang="ts">
    import {cn} from '../../lib/utils.js'
    import Avatar from './Avatar.svelte'
    import type {Snippet, SvelteComponent} from "svelte";

    type Props = {
        class?: string
        children?: Snippet
    }

    const {class: className, children}: Props = $props()

    const groupClasses = $derived(cn('flex -space-x-2', className))
</script>

<div class={groupClasses}>
    {#if children}
        {@render children()}
    {/if}
</div>