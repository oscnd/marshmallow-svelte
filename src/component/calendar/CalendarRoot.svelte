<script lang="ts">
	import { Calendar as CalendarPrimitive } from 'bits-ui'
	import type { DateValue } from '@internationalized/date'
	import type { CalendarRootProps } from 'bits-ui'

	export type Props = CalendarRootProps & {
		value?: any
		placeholder?: any
	}

	let { class: className, value = $bindable(), placeholder = $bindable(), ...props }: Props = $props()
</script>

<CalendarPrimitive.Root {...props} bind:value bind:placeholder class={className} />
