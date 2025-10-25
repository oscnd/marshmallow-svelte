<script lang="ts">
	import { Calendar } from 'bits-ui'
	import { cn } from '$/lib/utils'
	import type { CalendarCellProps } from 'bits-ui'

	export type Props = CalendarCellProps & {
		class?: string
	}

	let { class: className, ...props }: Props = $props()

	const classes = $derived(cn('relative p-0 text-center text-sm focus-within:relative focus-within:z-20', className))
</script>

<Calendar.Cell {...props} class={classes} />
