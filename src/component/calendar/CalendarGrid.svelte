<script lang="ts">
	import { Calendar } from 'bits-ui'
	import { cn } from '$/lib/utils'
	import type { CalendarGridProps } from 'bits-ui'

	export type Props = CalendarGridProps & {
		class?: string
	}

	let { class: className, ...props }: Props = $props()

	const classes = $derived(cn('w-full border-collapse space-y-1', className))
</script>

<Calendar.Grid {...props} class={classes} />
