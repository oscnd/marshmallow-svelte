<script module>
	import { defineMeta } from '@storybook/addon-svelte-csf'
	import { Select, SelectRoot, SelectTrigger, SelectContent, SelectItem, SelectPortal } from './index'

	const { Story } = defineMeta({
		title: 'Components/Select',
		component: Select,
		subcomponents: {
			SelectRoot,
			SelectTrigger,
			SelectContent,
			SelectItem,
			SelectPortal,
		},
		tags: ['autodocs'],
		parameters: {
			docs: {
				controls: {
					include: ['class', 'placeholder', 'disabled'],
				},
			},
		},
	})

	// Sample data for stories
	const fruits = [
		{ value: 'apple', label: 'Apple' },
		{ value: 'banana', label: 'Banana' },
		{ value: 'blueberry', label: 'Blueberry' },
		{ value: 'grape', label: 'Grape' },
		{ value: 'orange', label: 'Orange' },
		{ value: 'strawberry', label: 'Strawberry' },
		{ value: 'watermelon', label: 'Watermelon' },
	]

	const countries = [
		{ value: 'us', label: 'United States' },
		{ value: 'ca', label: 'Canada' },
		{ value: 'uk', label: 'United Kingdom' },
		{ value: 'fr', label: 'France' },
		{ value: 'de', label: 'Germany' },
		{ value: 'jp', label: 'Japan' },
		{ value: 'au', label: 'Australia' },
	]

	const users = [
		{ value: 'john@example.com', label: 'John Doe', disabled: false },
		{ value: 'jane@example.com', label: 'Jane Smith', disabled: false },
		{ value: 'bob@example.com', label: 'Bob Wilson', disabled: true },
		{ value: 'alice@example.com', label: 'Alice Johnson', disabled: false },
		{ value: 'charlie@example.com', label: 'Charlie Brown', disabled: true },
	]
</script>

<Story
	args={{
		options: fruits,
		placeholder: 'Select a fruit...',
		type: 'single',
	}}
	name="Basic"
/>

<Story
	args={{
		options: fruits,
		placeholder: 'Select fruits...',
		type: 'multiple',
	}}
	name="Multiple"
/>

<Story
	args={{
		options: fruits,
		placeholder: 'Select a fruit...',
		type: 'single',
		disabled: true,
	}}
	name="Disabled"
/>

<Story
	args={{
		options: users,
		placeholder: 'Select users...',
		type: 'multiple',
	}}
	name="With Disabled Items"
/>

<Story
	args={{
		options: fruits,
		placeholder: 'Styled select',
		type: 'single',
		class: 'max-w-xs',
		contentClass: 'bg-purple-50 border-purple-200',
		triggerClass: 'border-purple-300 focus:ring-purple-500',
	}}
	name="Custom Styled"
/>

{#snippet controlledTemplate(args)}
	<div class="space-y-4">
		<p class="text-muted-foreground text-sm">
			Selected: <code class="bg-muted rounded px-1">{args.value || 'None'}</code>
		</p>
		<Select {...args} bind:value={args.value} options={fruits} placeholder="Select a fruit..." />
		<div class="flex gap-2">
			<button
				class="bg-primary text-primary-foreground hover:bg-primary/90 rounded px-3 py-1 text-sm"
				onclick={() => (args.value = 'apple')}
			>
				Set to Apple
			</button>
			<button
				class="bg-secondary text-secondary-foreground hover:bg-secondary/90 rounded px-3 py-1 text-sm"
				onclick={() => (args.value = '')}
			>
				Clear
			</button>
		</div>
	</div>
{/snippet}

<Story
	args={{
		value: '',
	}}
	name="Controlled"
	template={controlledTemplate}
/>

{#snippet advancedTemplate(args)}
	<div class="space-y-6">
		<div class="grid grid-cols-1 gap-4 md:grid-cols-2">
			<div class="space-y-2">
				<label for="select1" class="text-sm font-medium">Fruit Select</label>
				<Select id="select1" options={fruits} placeholder="Choose one fruit" bind:value={args.fruitSelect} />
				<p class="text-muted-foreground text-xs">Selected: {args.fruitSelect || 'None'}</p>
			</div>

			<div class="space-y-2">
				<label for="select2" class="text-sm font-medium">Country Select</label>
				<Select id="select2" options={countries} placeholder="Select country" bind:value={args.countrySelect} />
				<p class="text-muted-foreground text-xs">Selected: {args.countrySelect || 'None'}</p>
			</div>

			<div class="space-y-2">
				<label for="select3" class="text-sm font-medium">Disabled Example</label>
				<Select id="select3" options={fruits} placeholder="This is disabled" disabled={true} value="apple" />
			</div>

			<div class="space-y-2">
				<label for="select4" class="text-sm font-medium">With Disabled Items</label>
				<Select id="select4" options={users} placeholder="Select user" bind:value={args.userSelect} />
				<p class="text-muted-foreground text-xs">Selected: {args.userSelect || 'None'}</p>
			</div>
		</div>

		<div class="bg-muted rounded p-4">
			<h3 class="mb-2 font-medium">Current State</h3>
			<div class="grid grid-cols-2 gap-2 font-mono text-sm">
				<div>Fruit: {args.fruitSelect || '-'}</div>
				<div>Country: {args.countrySelect || '-'}</div>
				<div>User: {args.userSelect || '-'}</div>
			</div>
		</div>

		<div class="flex gap-2">
			<button
				class="bg-primary text-primary-foreground hover:bg-primary/90 rounded px-3 py-1 text-sm"
				onclick={() => {
					args.fruitSelect = 'banana'
					args.countrySelect = 'us'
					args.userSelect = 'alice@example.com'
				}}
			>
				Set Demo Values
			</button>
			<button
				class="bg-secondary text-secondary-foreground hover:bg-secondary/90 rounded px-3 py-1 text-sm"
				onclick={() => {
					args.fruitSelect = ''
					args.countrySelect = ''
					args.userSelect = ''
				}}
			>
				Clear All
			</button>
		</div>
	</div>
{/snippet}

<Story
	args={{
		fruitSelect: '',
		countrySelect: '',
		userSelect: '',
	}}
	name="Advanced Examples"
	template={advancedTemplate}
/>
