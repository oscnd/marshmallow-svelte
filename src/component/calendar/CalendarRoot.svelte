<script lang="ts">
	import { Calendar } from 'bits-ui'
	import { cn } from '$/lib/utils'
	import type { DateValue } from '@internationalized/date'
	import type { CalendarRootProps } from 'bits-ui'

	export type Props = CalendarRootProps & {
		value?: any
		placeholder?: any
	}

	let { class: className, value = $bindable(), placeholder = $bindable(), ...props }: Props = $props()

	const classes = $derived(cn('p-3 max-w-[320px]', className))
</script>

<Calendar.Root {...props} weekdayFormat="short" bind:value bind:placeholder class={classes} />
