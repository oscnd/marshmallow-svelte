<script lang="ts">
	import { Calendar as CalendarPrimitive } from 'bits-ui'
	import type { CalendarHeaderProps } from 'bits-ui'

	export type Props = CalendarHeaderProps

	let { ...props }: Props = $props()
</script>

<CalendarPrimitive.Header {...props} />
