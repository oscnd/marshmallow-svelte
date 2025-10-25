<script lang="ts">
	import { Calendar as CalendarPrimitive } from 'bits-ui'
	import type { CalendarHeadingProps } from 'bits-ui'

	export type Props = CalendarHeadingProps

	let { ...props }: Props = $props()
</script>

<CalendarPrimitive.Heading {...props} />
