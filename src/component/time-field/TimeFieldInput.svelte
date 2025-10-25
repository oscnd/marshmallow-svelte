<script lang="ts">
	import { TimeField } from 'bits-ui'
	import { cn } from '$/lib/utils'
	import type { TimeFieldInputProps } from 'bits-ui'

	export type Props = TimeFieldInputProps

	let { class: className, ...props }: Props = $props()

	const classes = $derived(
		cn(
			'inline-flex items-center rounded-md border border-input bg-background px-3 py-2 text-sm ring-offset-background',
			'focus-within:outline-none focus-within:ring-2 focus-within:ring-ring focus-within:ring-offset-2',
			'disabled:cursor-not-allowed disabled:opacity-50',
			'data-[invalid]:border-destructive',
			className
		)
	)
</script>

<TimeField.Input {...props} class={classes} />
