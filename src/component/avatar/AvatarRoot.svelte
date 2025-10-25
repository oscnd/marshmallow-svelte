<script lang="ts">
	import '../../style/tailwind.css'
	import { Avatar, type AvatarRootProps } from 'bits-ui'
	import { cn } from '$/lib/utils'
	import type { SvelteComponent } from 'svelte'

	export type Props = AvatarRootProps

	const { class: className, children, ...props }: Props = $props()

	const classes = $derived(cn('relative flex h-10 w-10 shrink-0 overflow-hidden rounded-full', className))
</script>

<Avatar.Root {...props} class={classes}>
	{#if children}
		{@render children()}
	{/if}
</Avatar.Root>
