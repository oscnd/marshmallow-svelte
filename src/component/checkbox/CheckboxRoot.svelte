<script lang="ts">
	import { Checkbox as CheckboxPrimitive } from 'bits-ui'
	import type { Snippet } from 'svelte'
	import type { CheckboxRootProps } from 'bits-ui'

	export type Props = CheckboxRootProps & {
		/** Additional classes for the checkbox root */
		class?: string
	}

	let {
		class: className,
		children,
		checked = $bindable(false),
		indeterminate = $bindable(false),
		...props
	}: Props = $props()
</script>

<CheckboxPrimitive.Root {...props} bind:checked bind:indeterminate class={className} data-checkbox-root>
	{#if children}
		{@render children({ checked: checked || false, indeterminate: indeterminate || false })}
	{/if}
</CheckboxPrimitive.Root>
