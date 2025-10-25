<script lang="ts">
	import { RangeCalendar } from 'bits-ui'
	import type { RangeCalendarGridRowProps } from 'bits-ui'

	export type Props = RangeCalendarGridRowProps

	let { ...props }: Props = $props()
</script>

<RangeCalendar.GridRow {...props} />
