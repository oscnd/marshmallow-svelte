<script lang="ts">
	import { Calendar } from 'bits-ui'
	import type { CalendarHeadCellProps } from 'bits-ui'

	export type Props = CalendarHeadCellProps

	let { ...props }: Props = $props()
</script>

<Calendar.HeadCell {...props} />
