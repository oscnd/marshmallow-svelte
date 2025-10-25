<script lang="ts">
	import { Calendar } from 'bits-ui'
	import { cn } from '$/lib/utils'
	import type { CalendarDayProps } from 'bits-ui'

	export type Props = CalendarDayProps & {
		class?: string
	}

	let { class: className, ...props }: Props = $props()

	const classes = $derived(
		cn(
			'group relative inline-flex h-9 w-9 items-center justify-center rounded-md text-sm font-normal ring-offset-background transition-colors hover:bg-accent hover:text-accent-foreground focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2',
			'data-[selected]:bg-primary data-[selected]:text-primary-foreground',
			'data-[disabled]:text-muted-foreground data-[disabled]:opacity-50',
			'data-[outside-month]:text-muted-foreground data-[outside-month]:opacity-50',
			'before:absolute before:top-1 before:left-1/2 before:-translate-x-1/2 before:h-1 before:w-1 before:rounded-full before:bg-primary data-[selected]:before:bg-background before:hidden data-[today]:before:block',
			className
		)
	)
</script>

<Calendar.Day {...props} class={classes} />
