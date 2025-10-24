<script lang="ts">
	import { Switch as SwitchPrimitive } from 'bits-ui'
	import { cn } from '$/lib/utils'
	import type { Snippet } from 'svelte'
	import type { SwitchRootProps } from 'bits-ui'

	export type Props = SwitchRootProps & {
		/** Additional classes for the switch root */
		class?: string
		/** Switch root content */
		children?: Snippet
	}

	let { class: className, children, checked = $bindable(false), ...props }: Props = $props()

	const classes = $derived(
		cn(
			'peer inline-flex h-6 w-11 shrink-0 cursor-pointer items-center rounded-full border-2 border-transparent transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 focus-visible:ring-offset-background disabled:cursor-not-allowed disabled:opacity-50 data-[state=checked]:bg-primary data-[state=unchecked]:bg-input',
			className
		)
	)
</script>

<SwitchPrimitive.Root {...props} bind:checked class={classes}>
	{#if children}
		{@render children()}
	{/if}
</SwitchPrimitive.Root>
