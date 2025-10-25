<script lang="ts">
	import { TimeField } from 'bits-ui'
	import { cn } from '$/lib/utils'
	import type { TimeFieldLabelProps } from 'bits-ui'

	export type Props = TimeFieldLabelProps

	let { class: className, ...props }: Props = $props()

	const classes = $derived(
		cn(
			'text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70',
			'data-[invalid]:text-destructive',
			className
		)
	)
</script>

<TimeField.Label {...props} class={classes} />
