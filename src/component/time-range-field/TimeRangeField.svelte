<script lang="ts">
	import { TimeRangeField } from 'bits-ui'
	import type { Snippet } from 'svelte'
	import type { TimeRangeFieldRootProps, TimeValue } from 'bits-ui'
	import { cn } from '$/lib/utils'

	const types = ['start', 'end'] as const

	export type Props = TimeRangeFieldRootProps & {
		/** Additional classes for the root element */
		class?: string
		/** Label text */
		label?: string
		/** Value */
		value?: { start?: TimeValue; end?: TimeValue }
		/** Placeholder */
		placeholder?: TimeValue
		/** Children */
		children?: Snippet
	}

	let {
		class: className,
		label,
		value = $bindable(),
		placeholder = $bindable(),
		children,
		...restProps
	}: Props = $props()
</script>

<TimeRangeField.Root
	{...restProps}
	bind:value
	bind:placeholder
	class={cn('group flex w-full max-w-[320px] flex-col gap-1.5', className)}
>
	{#if label}
		<TimeRangeField.Label class="block text-sm font-medium select-none">
			{label}
		</TimeRangeField.Label>
	{/if}
	{#if children}
		{@render children()}
	{:else}
		<div
			class="h-input rounded-input border-border-input bg-background text-foreground focus-within:border-border-input-hover focus-within:shadow-date-field-focus hover:border-border-input-hover group-data-invalid:border-destructive flex w-full items-center border px-2 py-3 text-sm tracking-[0.01em] select-none"
		>
			{#each types as type (type)}
				<TimeRangeField.Input {type}>
					{#snippet children({ segments }: { segments: any[] })}
						{#each segments as { part, value }, i (part + i)}
							<div class="inline-block select-none">
								{#if part === 'literal'}
									<TimeRangeField.Segment {part} class="text-muted-foreground p-1">
										{value}
									</TimeRangeField.Segment>
								{:else}
									<TimeRangeField.Segment
										{part}
										class="rounded-5px hover:bg-muted focus:bg-muted focus:text-foreground aria-[valuetext=Empty]:text-muted-foreground px-1 py-1 focus-visible:ring-0! focus-visible:ring-offset-0!"
									>
										{value}
									</TimeRangeField.Segment>
								{/if}
							</div>
						{/each}
					{/snippet}
				</TimeRangeField.Input>
				{#if type === 'start'}
					<div aria-hidden="true" class="text-muted-foreground pr-2 pl-1">to</div>
				{/if}
			{/each}
		</div>
	{/if}
</TimeRangeField.Root>
