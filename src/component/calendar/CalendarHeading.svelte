<script lang="ts">
	import { Calendar } from 'bits-ui'
	import type { CalendarHeadingProps } from 'bits-ui'

	export type Props = CalendarHeadingProps

	let { ...props }: Props = $props()
</script>

<Calendar.Heading {...props} />
