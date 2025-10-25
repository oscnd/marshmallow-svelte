<script lang="ts">
	import { RangeCalendar } from 'bits-ui'
	import type { RangeCalendarGridHeadProps } from 'bits-ui'

	export type Props = RangeCalendarGridHeadProps

	let { ...props }: Props = $props()
</script>

<RangeCalendar.GridHead {...props} />
