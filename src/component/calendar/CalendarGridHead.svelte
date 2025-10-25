<script lang="ts">
	import { Calendar as CalendarPrimitive } from 'bits-ui'
	import type { CalendarGridHeadProps } from 'bits-ui'

	export type Props = CalendarGridHeadProps

	let { ...props }: Props = $props()
</script>

<CalendarPrimitive.GridHead {...props} />
