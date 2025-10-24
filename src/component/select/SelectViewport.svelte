<script lang="ts">
	import '$/style/tailwind.css'
	import { Select, type SelectViewportProps } from 'bits-ui'
	import { cn } from '$/lib/utils'

	export type Props = SelectViewportProps & {
		class?: string
	}

	let { class: className, children, ...props }: Props = $props()
</script>

<Select.Viewport class={cn(
	'p-1',
	className
)} {...props}>
	{#if children}
		{@render children()}
	{/if}
</Select.Viewport>