<script lang="ts">
	import { RangeCalendar } from 'bits-ui'
	import type { RangeCalendarHeadCellProps } from 'bits-ui'

	export type Props = RangeCalendarHeadCellProps

	let { ...props }: Props = $props()
</script>

<RangeCalendar.HeadCell {...props} />
