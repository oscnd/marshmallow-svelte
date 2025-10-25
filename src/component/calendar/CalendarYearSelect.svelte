<script lang="ts">
	import { Calendar } from 'bits-ui'
	import type { CalendarYearSelectProps } from 'bits-ui'

	export type Props = CalendarYearSelectProps

	let { ...props }: Props = $props()
</script>

<Calendar.YearSelect {...props} />
