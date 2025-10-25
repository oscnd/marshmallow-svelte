<script lang="ts">
	import { Calendar as CalendarPrimitive } from 'bits-ui'
	import type { CalendarGridProps } from 'bits-ui'

	export type Props = CalendarGridProps

	let { ...props }: Props = $props()
</script>

<CalendarPrimitive.Grid {...props} />
