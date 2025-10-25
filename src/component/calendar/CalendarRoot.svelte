<script lang="ts">
	import { Calendar as CalendarPrimitive } from 'bits-ui'
	import { cn } from '$/lib/utils'
	import type { DateValue } from '@internationalized/date'
	import type { CalendarRootProps } from 'bits-ui'

	export type Props = CalendarRootProps & {
		value?: any
		placeholder?: any
	}

	let { class: className, value = $bindable(), placeholder = $bindable(), ...props }: Props = $props()

	const classes = $derived(cn('p-3 max-w-[280px]', className))
</script>

<CalendarPrimitive.Root {...props} bind:value bind:placeholder class={classes} />
