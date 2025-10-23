<script lang="ts">
	import { Search } from '@lucide/svelte'
	import { Combobox } from 'bits-ui'
	import { cn } from '../../lib/utils.js'

	export type Props = {
		placeholder?: string
		class?: string
		showSearchIcon?: boolean
		oninput?: (e: Event & { currentTarget: HTMLInputElement }) => void
	} & Omit<Combobox.InputProps, 'class' | 'placeholder' | 'oninput'>

	let { placeholder = 'Search...', class: className, showSearchIcon = true, oninput, ...props }: Props = $props()

	const classes = $derived(
		cn(
			'h-10 w-full rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background file:border-0 file:bg-transparent file:text-sm file:font-medium placeholder:text-muted-foreground focus:outline-none focus:ring-2 focus:ring-ring focus:ring-offset-2 disabled:cursor-not-allowed disabled:opacity-50',
			showSearchIcon && 'pl-10',
			className
		)
	)
</script>

<div class="relative w-full">
	{#if showSearchIcon}
		<Search class="text-muted-foreground absolute top-1/2 left-3 h-4 w-4 -translate-y-1/2" />
	{/if}
	<Combobox.Input {placeholder} {oninput} class={classes} {...props} />
</div>
