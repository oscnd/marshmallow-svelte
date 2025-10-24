<script lang="ts">
	import { Checkbox as CheckboxPrimitive } from 'bits-ui'
	import type { Snippet } from 'svelte'
	import type { CheckboxGroupLabelProps } from 'bits-ui'

	export type Props = CheckboxGroupLabelProps & {
		/** Additional classes for the checkbox group label */
		class?: string
	}

	let { class: className, children, ...props }: Props = $props()
</script>

<CheckboxPrimitive.GroupLabel {...props} class={className} data-checkbox-group-label>
	{#if children}
		{@render children()}
	{/if}
</CheckboxPrimitive.GroupLabel>
