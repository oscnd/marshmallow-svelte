<script lang="ts">
	import '$/style/tailwind.css'
	import { DropdownMenu, type DropdownMenuSeparatorProps } from 'bits-ui'
	import { cn } from '$/lib/utils'

	export type Props = DropdownMenuSeparatorProps & {
		class?: string
	}

	let { class: className, ...props }: Props = $props()

	const classes = $derived(cn('mx-1 my-1 h-px bg-gray-200', className))
</script>

<DropdownMenu.Separator {...props} class={classes} />
