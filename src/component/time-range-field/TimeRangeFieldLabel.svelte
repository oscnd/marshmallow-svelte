<script lang="ts">
	import { TimeRangeField } from 'bits-ui'
	import { cn } from '$/lib/utils'
	import type { TimeRangeFieldLabelProps } from 'bits-ui'

	export type Props = TimeRangeFieldLabelProps

	let { class: className, ...props }: Props = $props()

	const classes = $derived(
		cn(
			'text-sm font-medium leading-none peer-disabled:cursor-not-allowed peer-disabled:opacity-70',
			'data-[invalid]:text-destructive',
			className
		)
	)
</script>

<TimeRangeField.Label {...props} class={classes} />
