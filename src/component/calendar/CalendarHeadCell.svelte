<script lang="ts">
	import { Calendar as CalendarPrimitive } from 'bits-ui'
	import type { CalendarHeadCellProps } from 'bits-ui'

	export type Props = CalendarHeadCellProps

	let { ...props }: Props = $props()
</script>

<CalendarPrimitive.HeadCell {...props} />
