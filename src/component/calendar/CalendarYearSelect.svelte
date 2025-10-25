<script lang="ts">
	import { Calendar as CalendarPrimitive } from 'bits-ui'
	import type { CalendarYearSelectProps } from 'bits-ui'

	export type Props = CalendarYearSelectProps

	let { ...props }: Props = $props()
</script>

<CalendarPrimitive.YearSelect {...props} />
