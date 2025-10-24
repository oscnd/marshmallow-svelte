<script lang="ts">
	import SwitchRoot from './SwitchRoot.svelte'
	import SwitchThumb from './SwitchThumb.svelte'
	import type { Props as SwitchRootProps } from './SwitchRoot.svelte'
	import type { Snippet } from 'svelte'
	import { cn } from '$/lib/utils'

	export type Props = SwitchRootProps & {
		/** Additional classes for the switch */
		class?: string
		/** Additional classes for the switch thumb */
		thumbClass?: string
		/** Switch thumb content */
		thumbChildren?: Snippet
	}

	let {
		class: className,
		thumbClass,
		thumbChildren,
		checked = $bindable(),
		...props
	}: Props = $props()

	const classes = $derived(cn(className))
</script>

<SwitchRoot {...props} class={classes} bind:checked>
	<SwitchThumb class={thumbClass}>
		{#if thumbChildren}
			{@render thumbChildren()}
		{/if}
	</SwitchThumb>
</SwitchRoot>