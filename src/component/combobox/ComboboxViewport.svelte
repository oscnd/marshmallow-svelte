<script lang="ts">
	import { Combobox } from 'bits-ui'
	import { cn } from '../../lib/utils.js'

	export type Props = {
		class?: string
		children?: any
	} & Combobox.ViewportProps

	let { class: className, children, ...props }: Props = $props()

	const classes = $derived(cn('p-1', className))
</script>

<Combobox.Viewport class={classes} {...props}>
	{#if children}
		{@render children()}
	{/if}
</Combobox.Viewport>
