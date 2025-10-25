<script lang="ts">
	import { Calendar as CalendarPrimitive } from 'bits-ui'
	import type { CalendarMonthSelectProps } from 'bits-ui'

	export type Props = CalendarMonthSelectProps

	let { ...props }: Props = $props()
</script>

<CalendarPrimitive.MonthSelect {...props} />
