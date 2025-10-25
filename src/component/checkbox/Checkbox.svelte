<script lang="ts">
	import { cn } from '$/lib/utils'
	import CheckboxRoot from './CheckboxRoot.svelte'
	import { Check, Minus } from '@lucide/svelte'
	import type { CheckboxRootProps } from 'bits-ui'
	import type { Snippet } from 'svelte'

	export type Props = CheckboxRootProps & {
		/** Additional classes for the checkbox */
		class?: string
		/** Children to render inside the checkbox */
		children?: Snippet
	}

	let {
		class: className,
		children,
		checked = $bindable(false),
		indeterminate = $bindable(false),
		disabled = false,
		...props
	}: Props = $props()

	const classes = $derived(
		cn(
			'peer h-4 w-4 shrink-0 rounded-sm border border-primary ring-offset-background focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50 data-[state=checked]:bg-primary data-[state=checked]:text-primary-foreground data-[state=indeterminate]:bg-primary data-[state=indeterminate]:text-primary-foreground',
			className
		)
	)
</script>

<CheckboxRoot {...props} bind:checked bind:indeterminate {disabled} class={classes}>
	{#if children}
		{@render children({ checked: checked || false, indeterminate: indeterminate || false })}
	{:else}
		<div class="flex h-4 w-4 items-center justify-center text-current">
			{#if indeterminate}
				<Minus class="h-3.5 w-3.5" stroke-width="3" />
			{:else if checked}
				<Check class="h-3.5 w-3.5" stroke-width="3" />
			{/if}
		</div>
	{/if}
</CheckboxRoot>
