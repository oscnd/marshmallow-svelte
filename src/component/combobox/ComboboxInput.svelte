<script lang="ts">
	import { Combobox as BitsCombobox, type ComboboxInputProps } from 'bits-ui'
	import { cn } from '$/lib/utils'

	export type Props = ComboboxInputProps & {
		class?: string
	}

	const { class: className, ...props }: Props = $props()

	const classes = $derived(
		cn(
			'flex h-10 w-full rounded-md border border-gray-200 bg-white px-10 py-2 text-sm ring-offset-white file:border-0 file:bg-transparent file:text-sm file:font-medium placeholder:text-gray-500 focus-visible:ring-2 focus-visible:ring-gray-900 focus-visible:ring-offset-2 focus-visible:outline-none disabled:cursor-not-allowed disabled:opacity-50',
			className
		)
	)
</script>

<BitsCombobox.Input {...props} class={classes} />
