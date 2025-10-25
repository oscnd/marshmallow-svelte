<script lang="ts">
	import { Calendar } from 'bits-ui'
	import type { CalendarGridHeadProps } from 'bits-ui'

	export type Props = CalendarGridHeadProps

	let { ...props }: Props = $props()
</script>

<Calendar.GridHead {...props} />
