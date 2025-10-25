<script lang="ts">
	import { cn } from '$/lib/utils'
	import AvatarRoot from './AvatarRoot.svelte'
	import AvatarImage from './AvatarImage.svelte'
	import AvatarFallback from './AvatarFallback.svelte'
	import type { AvatarRootProps } from 'bits-ui'

	export type NameProps =
		| { firstname: string; lastname: string; fullname?: never }
		| { fullname: string; firstname?: never; lastname?: never }

	export type Props = {
		src?: string
		border?: boolean
		class?: string
	} & NameProps &
		AvatarRootProps

	const { src, border = false, class: className, ...props }: Props = $props()

	const { firstname, lastname, fullname } = props as any

	const classes = $derived(
		cn('relative flex h-10 w-10 shrink-0 overflow-hidden rounded-full', border && 'ring-2 ring-white', className)
	)

	// Generate initials from name
	const initials = $derived.by(() => {
		if (fullname) {
			return fullname
				.split(' ')
				.map((n: string) => n[0])
				.join('')
				.toUpperCase()
				.slice(0, 2)
		} else if (firstname && lastname) {
			return (firstname[0] + lastname[0]).toUpperCase()
		}
		return '?'
	})
</script>

<AvatarRoot {...props} class={classes}>
	{#if src}
		<AvatarImage {src} alt={fullname || `${firstname} ${lastname}`} />
	{/if}
	<AvatarFallback>{initials}</AvatarFallback>
</AvatarRoot>
