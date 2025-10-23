<script lang="ts">
	import '../../style/tailwind.css'
	import { Avatar, type AvatarFallbackProps } from 'bits-ui'
	import type { SvelteComponent } from 'svelte'
	import { cn } from '../../lib/utils.js'

	export type Props = AvatarFallbackProps

	const { class: className, children, ...props }: Props = $props()

	const classes = $derived(
		cn('flex h-full w-full items-center justify-center rounded-full bg-muted', className)
	)
</script>

<Avatar.Fallback {...props} class={classes}>
	{#if children}
		{@render children()}
	{/if}
</Avatar.Fallback>
