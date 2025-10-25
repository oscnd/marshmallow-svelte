<script lang="ts">
	import { Avatar as BitsAvatar, type AvatarImageProps } from 'bits-ui'
	import { cn } from '$/lib/utils'

	type Props = AvatarImageProps

	const { class: className, ...props }: Props = $props()

	const classes = $derived(cn('aspect-square h-full w-full object-cover', className))
</script>

<BitsAvatar.Image {...props} class={classes} />
