<script lang="ts">
	import { Calendar } from 'bits-ui'
	import type { CalendarGridRowProps } from 'bits-ui'

	export type Props = CalendarGridRowProps

	let { ...props }: Props = $props()
</script>

<Calendar.GridRow {...props} />
