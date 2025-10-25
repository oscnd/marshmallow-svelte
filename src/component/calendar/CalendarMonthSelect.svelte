<script lang="ts">
	import { Calendar } from 'bits-ui'
	import type { CalendarMonthSelectProps } from 'bits-ui'

	export type Props = CalendarMonthSelectProps

	let { ...props }: Props = $props()
</script>

<Calendar.MonthSelect {...props} />
