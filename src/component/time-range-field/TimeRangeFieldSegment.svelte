<script lang="ts">
	import { TimeRangeField } from 'bits-ui'
	import { cn } from '$/lib/utils'
	import type { TimeRangeFieldSegmentProps } from 'bits-ui'

	export type Props = TimeRangeFieldSegmentProps

	let { class: className, ...props }: Props = $props()

	const classes = $derived(
		cn(
			'inline-flex items-center justify-center tabular-nums text-foreground',
			'focus:outline-none focus:ring-2 focus:ring-ring focus:ring-offset-2 focus:rounded',
			'data-[segment=literal]:text-muted-foreground',
			'data-[segment=hour]:font-medium',
			'data-[segment=minute]:font-medium',
			'data-[segment=second]:font-medium',
			'data-[segment=dayPeriod]:font-medium',
			'data-[segment=timeZoneName]:font-medium',
			'data-[readonly]:cursor-default',
			'data-[disabled]:cursor-not-allowed data-[disabled]:opacity-50',
			'data-[invalid]:text-destructive',
			className
		)
	)
</script>

<TimeRangeField.Segment {...props} class={classes} />
