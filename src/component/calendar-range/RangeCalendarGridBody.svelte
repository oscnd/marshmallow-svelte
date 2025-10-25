<script lang="ts">
	import { RangeCalendar } from 'bits-ui'
	import type { RangeCalendarGridBodyProps } from 'bits-ui'

	export type Props = RangeCalendarGridBodyProps

	let { ...props }: Props = $props()
</script>

<RangeCalendar.GridBody {...props} />
