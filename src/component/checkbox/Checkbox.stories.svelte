<script module>
	import { defineMeta } from '@storybook/addon-svelte-csf'
	import { Checkbox, CheckboxGroup, CheckboxGroupLabel } from './index'
	import { Check, Minus } from '@lucide/svelte'

	const { Story } = defineMeta({
		title: 'Components/Checkbox',
		component: Checkbox,
		subcomponents: {
			CheckboxGroup,
			CheckboxGroupLabel,
		},
		tags: ['autodocs'],
		parameters: {
			docs: {
				controls: {
					include: ['checked', 'indeterminate', 'disabled', 'required', 'name', 'value', 'class'],
				},
			},
		},
	})
</script>

<script>
	import { cn } from '$/lib/utils.js'
</script>

{#snippet basicTemplate(args)}
	<div class="flex items-center space-x-2">
		<Checkbox
			class={args.class}
			bind:checked={args.checked}
			indeterminate={args.indeterminate ?? false}
			disabled={args.disabled}
			required={args.required}
			name={args.name}
			value={args.value}
		/>
		<span>Accept terms and conditions</span>
	</div>
{/snippet}

<Story
	args={{
		checked: false,
	}}
	name="Default"
	template={basicTemplate}
/>

<Story
	args={{
		checked: true,
	}}
	name="Checked"
	template={basicTemplate}
/>

<Story
	args={{
		checked: false,
		indeterminate: true,
	}}
	name="Indeterminate"
	template={basicTemplate}
/>

<Story
	args={{
		checked: false,
		disabled: true,
	}}
	name="Disabled"
	template={basicTemplate}
/>

{#snippet withLabelTemplate(args)}
	<div class="flex items-center space-x-2">
		<Checkbox
			class={args.class}
			bind:checked={args.checked}
			indeterminate={args.indeterminate ?? false}
			disabled={args.disabled}
			required={args.required}
			name={args.name}
			value={args.value}
			id="terms"
		/>
		<label
			for="terms"
			class="text-sm leading-none font-medium peer-disabled:cursor-not-allowed peer-disabled:opacity-70"
		>
			Accept terms and conditions
		</label>
	</div>
{/snippet}

<Story
	args={{
		checked: false,
	}}
	name="With Label"
	template={withLabelTemplate}
/>

{#snippet checkboxGroupTemplate(args)}
	<div class="space-y-4">
		<CheckboxGroup name="notifications" bind:value={args.groupValue}>
			<CheckboxGroupLabel>Notifications</CheckboxGroupLabel>
			<div class="mt-3 space-y-3">
				{#each ['marketing', 'promotions', 'news', 'updates'] as option}
					<div class="flex items-center space-x-2">
						<Checkbox value={option} id={option} bind:disabled={args.disabled} />
						<label
							for={option}
							class="text-sm leading-none font-medium capitalize peer-disabled:cursor-not-allowed peer-disabled:opacity-70"
						>
							{option}
						</label>
					</div>
				{/each}
			</div>
		</CheckboxGroup>
		<div class="bg-muted mt-4 rounded p-3 text-sm">
			Selected values: {Array.isArray(args.groupValue) ? args.groupValue.join(', ') : 'none'}
		</div>
	</div>
{/snippet}

<Story
	args={{
		groupValue: ['marketing', 'promotions'],
	}}
	name="Checkbox Group"
	template={checkboxGroupTemplate}
/>

{#snippet customStyledTemplate(args)}
	<div class="space-y-4">
		<h3 class="text-lg font-semibold">Preferences</h3>
		<div class="space-y-3">
			<Checkbox
				class={cn('h-5 w-5 rounded border-gray-300 text-blue-600 focus:ring-blue-500', args.class)}
				bind:checked={args.checked1}
				id="emails"
			>
				{#snippet children({ checked, indeterminate })}
					{#if indeterminate}
						<Minus class="h-4 w-4" stroke-width="3" />
					{:else if checked}
						<Check class="h-4 w-4" stroke-width="3" />
					{/if}
				{/snippet}
			</Checkbox>
			<label for="emails" class="ml-2 text-sm font-medium text-gray-700"> Email notifications </label>
		</div>

		<div class="space-y-3">
			<Checkbox
				class={cn('h-5 w-5 rounded border-gray-300 text-blue-600 focus:ring-blue-500', args.class)}
				bind:checked={args.checked2}
				id="sms"
			>
				{#snippet children({ checked, indeterminate })}
					{#if indeterminate}
						<Minus class="h-4 w-4" stroke-width="3" />
					{:else if checked}
						<Check class="h-4 w-4" stroke-width="3" />
					{/if}
				{/snippet}
			</Checkbox>
			<label for="sms" class="ml-2 text-sm font-medium text-gray-700"> SMS notifications </label>
		</div>
	</div>
{/snippet}

<Story
	args={{
		checked1: true,
		checked2: false,
	}}
	name="Custom Styled"
	template={customStyledTemplate}
	parameters={{
		docs: {
			description: {
				story: 'Custom styled checkboxes with different sizing and colors.',
			},
		},
	}}
/>
