<script lang="ts">
	import { Calendar as CalendarPrimitive } from 'bits-ui'
	import type { CalendarNextButtonProps } from 'bits-ui'

	export type Props = CalendarNextButtonProps

	let { ...props }: Props = $props()
</script>

<CalendarPrimitive.NextButton {...props} />
