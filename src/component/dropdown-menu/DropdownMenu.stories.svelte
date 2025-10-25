<script module>
	import { defineMeta } from '@storybook/addon-svelte-csf'
	import {
		DropdownMenu,
		DropdownMenuRoot,
		DropdownMenuTrigger,
		DropdownMenuContent,
		DropdownMenuItem,
		DropdownMenuCheckboxItem,
		DropdownMenuRadioGroup,
		DropdownMenuRadioItem,
		DropdownMenuSub,
		DropdownMenuSubTrigger,
		DropdownMenuSubContent,
		DropdownMenuSeparator,
		DropdownMenuPortal,
	} from './index'

	const { Story } = defineMeta({
		title: 'Components/DropdownMenu',
		component: DropdownMenu,
		subcomponents: {
			DropdownMenuRoot,
			DropdownMenuTrigger,
			DropdownMenuContent,
			DropdownMenuItem,
			DropdownMenuCheckboxItem,
			DropdownMenuRadioGroup,
			DropdownMenuRadioItem,
			DropdownMenuSub,
			DropdownMenuSubTrigger,
			DropdownMenuSubContent,
			DropdownMenuSeparator,
			DropdownMenuPortal,
		},
		tags: ['autodocs'],
		parameters: {
			docs: {
				controls: {
					include: ['class', 'disabled'],
				},
			},
		},
	})

	// Sample data for stories
	const basicItems = [
		{ label: 'Profile', type: 'item' },
		{ label: 'Billing', type: 'item' },
		{ label: 'Settings', type: 'item' },
		{ label: 'Keyboard shortcuts', type: 'item' },
		{ type: 'separator' },
		{ label: 'Sign out', type: 'item' },
	]

	const itemsWithCheckboxes = [
		{ label: 'Show Bookmarks Bar', type: 'checkbox' },
		{ label: 'Show Full URLs', type: 'checkbox' },
		{ type: 'separator' },
		{ label: 'Show Sidebar', type: 'checkbox' },
		{ label: 'Show Status Bar', type: 'checkbox' },
	]

	const itemsWithRadio = [
		{ label: 'Panel', type: 'label' },
		{ label: 'Left', type: 'radio', value: 'left' },
		{ label: 'Right', type: 'radio', value: 'right' },
		{ label: 'Bottom', type: 'radio', value: 'bottom' },
	]

	const itemsWithSubmenu = [
		{ label: 'New Tab', type: 'item' },
		{ label: 'New Window', type: 'item' },
		{ label: 'New Incognito Window', type: 'item' },
		{ type: 'separator' },
		{
			label: 'More Tools',
			type: 'item',
			children: [
				{ label: 'Save Page As...', type: 'item' },
				{ label: 'Create Shortcut...', type: 'item' },
				{ label: 'Name Window...', type: 'item' },
				{ type: 'separator' },
				{ label: 'Developer Tools', type: 'item' },
			],
		},
		{ type: 'separator' },
		{
			label: 'Bookmarks',
			type: 'item',
			children: [
				{ label: 'Bookmark this Tab...', type: 'item' },
				{ label: 'Bookmark All Tabs...', type: 'item' },
				{ type: 'separator' },
				{ label: 'Favorites', type: 'item' },
				{ label: 'History', type: 'item' },
			],
		},
	]

	const itemsWithDisabled = [
		{ label: 'Back', type: 'item', disabled: true },
		{ label: 'Forward', type: 'item', disabled: true },
		{ label: 'Reload', type: 'item' },
		{ type: 'separator' },
		{ label: 'View Page Source', type: 'item' },
		{ label: 'Inspect', type: 'item', disabled: true },
	]
</script>

<Story
	args={{
		items: basicItems,
	}}
	name="Basic"
/>

<Story
	args={{
		items: itemsWithCheckboxes,
	}}
	name="With Checkboxes"
/>

<Story
	args={{
		items: itemsWithRadio,
	}}
	name="With Radio Group"
/>

<Story
	args={{
		items: itemsWithSubmenu,
	}}
	name="With Submenu"
/>

<Story
	args={{
		items: itemsWithDisabled,
	}}
	name="With Disabled Items"
/>

<Story
	args={{
		items: basicItems,
		class: 'max-w-xs',
		contentClass: 'bg-purple-50 border-purple-200',
		triggerClass: 'bg-purple-100 hover:bg-purple-200 rounded-md p-2',
	}}
	name="Custom Styled"
/>

{#snippet controlledTemplate(args)}
	<div class="space-y-4">
		<p class="text-muted-foreground text-sm">
			Menu is <code class="bg-muted rounded px-1">{args.isOpen ? 'Open' : 'Closed'}</code>
		</p>
		<DropdownMenu {...args} bind:open={args.isOpen} items={basicItems} />
		<div class="flex gap-2">
			<button
				class="bg-primary text-primary-foreground hover:bg-primary/90 rounded px-3 py-1 text-sm"
				onclick={() => (args.isOpen = true)}
			>
				Open Menu
			</button>
			<button
				class="bg-secondary text-secondary-foreground hover:bg-secondary/90 rounded px-3 py-1 text-sm"
				onclick={() => (args.isOpen = false)}
			>
				Close Menu
			</button>
		</div>
	</div>
{/snippet}

<Story
	args={{
		isOpen: false,
	}}
	name="Controlled"
	template={controlledTemplate}
/>

{#snippet customTriggerTemplate(args)}
	<div class="space-y-4">
		<DropdownMenu {...args} items={basicItems} class="inline-block">
			{#snippet trigger()}
				<button class="rounded bg-blue-500 px-4 py-2 text-sm font-medium text-white hover:bg-blue-600">
					Options Menu
				</button>
			{/snippet}
		</DropdownMenu>
		<p class="text-muted-foreground text-sm">
			Click the "Options Menu" button to see the drodpdown with a custom trigger
		</p>
	</div>
{/snippet}

<Story args={{}} name="Custom Trigger" template={customTriggerTemplate} />

{#snippet advancedTemplate(args)}
	<div class="space-y-6">
		<div class="grid grid-cols-1 gap-4 md:grid-cols-2">
			<div class="space-y-2">
				<div class="text-sm font-medium">User Menu</div>
				<DropdownMenu items={basicItems} />
			</div>
			<div class="space-y-2">
				<div class="text-sm font-medium">View Options</div>
				<DropdownMenu items={itemsWithCheckboxes} />
			</div>
			<div class="space-y-2">
				<div class="text-sm font-medium">Panel Position</div>
				<DropdownMenu items={itemsWithRadio} />
			</div>
			<div class="space-y-2">
				<div class="text-sm font-medium">Browser Tools</div>
				<DropdownMenu items={itemsWithSubmenu} />
			</div>
		</div>
	</div>
{/snippet}

<Story args={{}} name="Advanced Examples" template={advancedTemplate} />
