<script lang="ts">
	import { TimeField } from 'bits-ui'
	import type { Snippet } from 'svelte'
	import type { TimeFieldRootProps, TimeValue } from 'bits-ui'
	import { cn } from '$/lib/utils'
	import { TimeFieldRoot } from './index'

	export type Props = TimeFieldRootProps & {
		/** Additional classes for the root element */
		class?: string
		/** Label text */
		label?: string
		/** Value */
		value?: TimeValue
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

<TimeFieldRoot {...restProps} bind:placeholder bind:value>
	{#if label}
		<TimeField.Label class="block text-sm font-medium select-none">
			{label}
		</TimeField.Label>
	{/if}
	{#if children}
		{@render children()}
	{:else}
		<div
			class="h-input rounded-input border-border-input bg-background text-foreground focus-within:border-border-input-hover focus-within:shadow-date-field-focus hover:border-border-input-hover group-data-invalid:border-destructive flex w-full items-center border px-2 py-3 text-sm tracking-[0.01em] select-none"
		>
			<TimeField.Input>
				{#snippet children({ segments }: { segments: any })}
					{#each segments as { part, value }, i (part + i)}
						<div class="inline-block select-none">
							{#if part === 'literal'}
								<TimeField.Segment {part} class="text-muted-foreground p-1">
									{value}
								</TimeField.Segment>
							{:else}
								<TimeField.Segment
									{part}
									class="rounded-5px hover:bg-muted focus:bg-muted focus:text-foreground aria-[valuetext=Empty]:text-muted-foreground px-1 py-1 focus-visible:ring-0! focus-visible:ring-offset-0!"
								>
									{value}
								</TimeField.Segment>
							{/if}
						</div>
					{/each}
				{/snippet}
			</TimeField.Input>
		</div>
	{/if}
</TimeFieldRoot>
