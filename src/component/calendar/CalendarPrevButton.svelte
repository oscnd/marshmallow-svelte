<script lang="ts">
	import { Calendar as CalendarPrimitive } from 'bits-ui'
	import type { CalendarPrevButtonProps } from 'bits-ui'

	export type Props = CalendarPrevButtonProps

	let { ...props }: Props = $props()
</script>

<CalendarPrimitive.PrevButton {...props} />
