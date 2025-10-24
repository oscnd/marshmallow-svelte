<script lang="ts">
	import { Switch as SwitchPrimitive } from 'bits-ui'
	import { cn } from '$/lib/utils'
	import type { Snippet } from 'svelte'
	import type { SwitchThumbProps } from 'bits-ui'

	export type Props = SwitchThumbProps & {
		/** Additional classes for the switch thumb */
		class?: string
		/** Switch thumb content */
		children?: Snippet
	}

	let { class: className, children, ...props }: Props = $props()

	const classes = $derived(
		cn(
			'pointer-events-none block h-5 w-5 rounded-full bg-background shadow-lg ring-0 transition-transform data-[state=checked]:translate-x-5 data-[state=unchecked]:translate-x-0',
			className
		)
	)
</script>

<SwitchPrimitive.Thumb {...props} class={classes}>
	{#if children}
		{@render children()}
	{/if}
</SwitchPrimitive.Thumb>