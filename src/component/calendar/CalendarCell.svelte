<script lang="ts">
	import { Calendar as CalendarPrimitive } from 'bits-ui'
	import type { CalendarCellProps } from 'bits-ui'

	export type Props = CalendarCellProps

	let { ...props }: Props = $props()
</script>

<CalendarPrimitive.Cell {...props} />
