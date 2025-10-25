<script lang="ts">
	import { Calendar } from 'bits-ui'
	import type { CalendarGridBodyProps } from 'bits-ui'

	export type Props = CalendarGridBodyProps

	let { ...props }: Props = $props()
</script>

<Calendar.GridBody {...props} />
