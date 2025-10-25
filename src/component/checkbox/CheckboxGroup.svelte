<script lang="ts">
	import { Checkbox as CheckboxPrimitive } from 'bits-ui'
	import type { Snippet } from 'svelte'
	import type { CheckboxGroupProps } from 'bits-ui'

	export type Props = CheckboxGroupProps & {
		/** Additional classes for the checkbox group */
		class?: string
	}

	let { class: className, children, value = $bindable(), ...props }: Props = $props()
</script>

<CheckboxPrimitive.Group {...props} bind:value class={className} data-checkbox-group>
	{#if children}
		{@render children()}
	{/if}
</CheckboxPrimitive.Group>
