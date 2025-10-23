<script module>
	import { defineMeta } from '@storybook/addon-svelte-csf'
	import {
		Combobox,
		ComboboxRoot,
		ComboboxInput,
		ComboboxTrigger,
		ComboboxContent,
		ComboboxItem,
		ComboboxPortal,
	} from './index'

	const { Story } = defineMeta({
		title: 'Components/Combobox',
		component: Combobox,
		subcomponents: {
			ComboboxRoot,
			ComboboxInput,
			ComboboxTrigger,
			ComboboxContent,
			ComboboxItem,
			ComboboxPortal,
		},
		tags: ['autodocs'],
		parameters: {
			docs: {
				controls: {
					include: ['class', 'placeholder', 'searchPlaceholder', 'disabled', 'allowCustom'],
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
	}}
	name="Basic"
/>

<Story
	args={{
		options: countries,
		placeholder: 'Select a country...',
		searchPlaceholder: 'Search countries...',
	}}
	name="With Search"
/>

<Story
	args={{
		options: fruits,
		placeholder: 'Select a fruit...',
		disabled: true,
	}}
	name="Disabled"
/>

<Story
	args={{
		options: fruits,
		placeholder: 'Select or add a fruit...',
		searchPlaceholder: 'Search or type to add...',
		allowCustom: true,
	}}
	name="Allow Custom Values"
/>

<Story
	args={{
		options: users,
		placeholder: 'Select a user...',
		searchPlaceholder: 'Search users...',
	}}
	name="With Disabled Items"
/>

<Story
	args={{
		options: fruits,
		placeholder: 'Styled combobox',
		class: 'max-w-xs',
		contentClass: 'bg-purple-50 border-purple-200',
		triggerClass: 'border-purple-300 focus:ring-purple-500',
		inputClass: 'border-purple-200 focus:ring-purple-500',
	}}
	name="Custom Styled"
/>

{#snippet controlledTemplate(args)}
	<div class="space-y-4">
		<p class="text-muted-foreground text-sm">
			Selected value: <code class="bg-muted rounded px-1">{args.selectedValue || 'None'}</code>
		</p>
		<Combobox {...args} bind:value={args.selectedValue} options={fruits} placeholder="Select a fruit..." />
		<div class="flex gap-2">
			<button
				class="bg-primary text-primary-foreground hover:bg-primary/90 rounded px-3 py-1 text-sm"
				onclick={() => (args.selectedValue = 'apple')}
			>
				Set to Apple
			</button>
			<button
				class="bg-secondary text-secondary-foreground hover:bg-secondary/90 rounded px-3 py-1 text-sm"
				onclick={() => (args.selectedValue = '')}
			>
				Clear
			</button>
		</div>
	</div>
{/snippet}

<Story
	name="Controlled"
	args={{
		selectedValue: '',
	}}
	template={controlledTemplate}
/>

{#snippet formTemplate(args)}
	<div class="space-y-4">
		<div class="space-y-2">
			<label class="text-sm font-medium">Favorite Fruit</label>
			<Combobox
				name="favoriteFruit"
				options={fruits}
				placeholder="Select your favorite fruit..."
				bind:value={args.selectedFruit}
			/>
		</div>

		<div class="space-y-2">
			<label class="text-sm font-medium">Country</label>
			<Combobox
				name="country"
				options={countries}
				placeholder="Select your country..."
				bind:value={args.selectedCountry}
			/>
		</div>

		<div class="space-y-2">
			<label class="text-sm font-medium">Custom Skill (with search)</label>
			<Combobox
				name="skill"
				options={[
					{ value: 'javascript', label: 'JavaScript' },
					{ value: 'typescript', label: 'TypeScript' },
					{ value: 'react', label: 'React' },
					{ value: 'vue', label: 'Vue' },
					{ value: 'svelte', label: 'Svelte' },
				]}
				placeholder="Select or add a skill..."
				searchPlaceholder="Search skills..."
				allowCustom={true}
				bind:value={args.selectedSkill}
			/>
		</div>

		<div class="flex gap-2">
			<button
				class="bg-primary text-primary-foreground hover:bg-primary/90 rounded px-4 py-2"
				onclick={() =>
					alert(
						`Form would submit with: Fruit=${args.selectedFruit}, Country=${args.selectedCountry}, Skill=${args.selectedSkill}`
					)}
			>
				Submit Form
			</button>
			<button
				class="bg-secondary text-secondary-foreground hover:bg-secondary/90 rounded px-4 py-2"
				onclick={() => {
					args.selectedFruit = ''
					args.selectedCountry = ''
					args.selectedSkill = ''
				}}
			>
				Reset
			</button>
		</div>

		<div class="bg-muted mt-4 rounded p-3 text-sm">
			<strong>Form state:</strong>
			<ul class="mt-1 space-y-1">
				<li>Fruit: {args.selectedFruit || 'None'}</li>
				<li>Country: {args.selectedCountry || 'None'}</li>
				<li>Skill: {args.selectedSkill || 'None'}</li>
			</ul>
		</div>
	</div>
{/snippet}

<Story
	name="Form Integration"
	args={{
		selectedFruit: '',
		selectedCountry: '',
		selectedSkill: '',
	}}
	template={formTemplate}
/>

{#snippet advancedTemplate(args)}
	<div class="space-y-6">
		<div class="grid grid-cols-1 gap-4 md:grid-cols-2">
			<div class="space-y-2">
				<label class="text-sm font-medium">Single Select</label>
				<Combobox options={fruits} placeholder="Choose one fruit" bind:value={args.singleSelect} />
				<p class="text-muted-foreground text-xs">Selected: {args.singleSelect || 'None'}</p>
			</div>

			<div class="space-y-2">
				<label class="text-sm font-medium">With Custom Values</label>
				<Combobox
					options={fruits}
					placeholder="Add custom fruit if needed"
					allowCustom={true}
					bind:value={args.customValue}
				/>
				<p class="text-muted-foreground text-xs">Selected: {args.customValue || 'None'}</p>
			</div>

			<div class="space-y-2">
				<label class="text-sm font-medium">Disabled Example</label>
				<Combobox options={fruits} placeholder="This is disabled" disabled={true} value="apple" />
			</div>

			<div class="space-y-2">
				<label class="text-sm font-medium">With Disabled Items</label>
				<Combobox options={users} placeholder="Select user" bind:value={args.userSelect} />
				<p class="text-muted-foreground text-xs">Selected: {args.userSelect || 'None'}</p>
			</div>
		</div>

		<div class="bg-muted rounded p-4">
			<h3 class="mb-2 font-medium">Current State</h3>
			<div class="grid grid-cols-2 gap-2 font-mono text-sm">
				<div>Single: {args.singleSelect || '-'}</div>
				<div>Custom: {args.customValue || '-'}</div>
				<div>User: {args.userSelect || '-'}</div>
			</div>
		</div>

		<div class="flex gap-2">
			<button
				class="bg-primary text-primary-foreground hover:bg-primary/90 rounded px-3 py-1 text-sm"
				onclick={() => {
					args.singleSelect = 'banana'
					args.customValue = 'mango'
					args.userSelect = 'alice@example.com'
				}}
			>
				Set Demo Values
			</button>
			<button
				class="bg-secondary text-secondary-foreground hover:bg-secondary/90 rounded px-3 py-1 text-sm"
				onclick={() => {
					args.singleSelect = ''
					args.customValue = ''
					args.userSelect = ''
				}}
			>
				Clear All
			</button>
		</div>
	</div>
{/snippet}

<Story
	name="Advanced Examples"
	args={{
		singleSelect: '',
		customValue: '',
		userSelect: '',
	}}
	template={advancedTemplate}
/>
