<script lang="ts">
	import { Calendar as CalendarPrimitive } from 'bits-ui'
	import { cn } from '$/lib/utils'
	import type { CalendarHeaderProps } from 'bits-ui'

	export type Props = CalendarHeaderProps & {
		class?: string
	}

	let { class: className, ...props }: Props = $props()

	const classes = $derived(cn('flex items-center justify-between ml-2 mb-4', className))
</script>

<CalendarPrimitive.Header {...props} class={classes} />
