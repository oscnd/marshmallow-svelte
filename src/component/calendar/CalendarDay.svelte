<script lang="ts">
	import { Calendar as CalendarPrimitive } from 'bits-ui'
	import type { CalendarDayProps } from 'bits-ui'

	export type Props = CalendarDayProps & {
		class?: string
	}

	let { class: className, ...props }: Props = $props()
</script>

<CalendarPrimitive.Day {...props} class={className} />
