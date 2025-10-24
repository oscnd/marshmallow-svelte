<script lang="ts">
	import '$/style/tailwind.css'
	import { Select, type SelectPortalProps } from 'bits-ui'
	import { cn } from '$/lib/utils'

	export type Props = SelectPortalProps & {
		class?: string
	}

	let { class: className, children, ...props }: Props = $props()
</script>

<Select.Portal {...props}>
	{#if children}
		{@render children()}
	{/if}
</Select.Portal>