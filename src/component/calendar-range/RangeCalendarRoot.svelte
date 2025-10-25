<script lang="ts">
	import { RangeCalendar } from 'bits-ui'
	import { cn } from '$/lib/utils'
	import type { DateValue } from '@internationalized/date'
	import type { RangeCalendarRootProps } from 'bits-ui'

	export type Props = RangeCalendarRootProps & {
		value?: any
		placeholder?: any
	}

	let { class: className, value = $bindable(), placeholder = $bindable(), ...props }: Props = $props()

	const classes = $derived(cn('p-3 max-w-[320px]', className))
</script>

<RangeCalendar.Root {...props} weekdayFormat="short" fixedWeeks={true} class={classes} bind:value bind:placeholder />
