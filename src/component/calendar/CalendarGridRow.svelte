<script lang="ts">
	import { Calendar as CalendarPrimitive } from 'bits-ui'
	import type { CalendarGridRowProps } from 'bits-ui'

	export type Props = CalendarGridRowProps

	let { ...props }: Props = $props()
</script>

<CalendarPrimitive.GridRow {...props} />
