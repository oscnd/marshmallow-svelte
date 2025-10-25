<script lang="ts">
	import { Calendar as CalendarPrimitive } from 'bits-ui'
	import type { CalendarGridBodyProps } from 'bits-ui'

	export type Props = CalendarGridBodyProps

	let { ...props }: Props = $props()
</script>

<CalendarPrimitive.GridBody {...props} />
