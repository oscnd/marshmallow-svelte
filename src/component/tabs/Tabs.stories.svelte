<script module>
	import { defineMeta } from '@storybook/addon-svelte-csf'
	import { Tabs, TabsRoot, TabsList, TabsTrigger, TabsContent } from './index'

	const { Story } = defineMeta({
		title: 'Components/Tabs',
		component: Tabs,
		subcomponents: {
			TabsRoot,
			TabsList,
			TabsTrigger,
			TabsContent,
		},
		tags: ['autodocs'],
		parameters: {
			docs: {
				controls: {
					include: ['class', 'listClass', 'triggerClass', 'contentClass', 'value'],
				},
			},
		},
	})
</script>

{#snippet basicTemplate(args)}
	<Tabs
		class={args.class}
		listClass={args.listClass}
		triggerClass={args.triggerClass}
		contentClass={args.contentClass}
		bind:value={args.value}
		tabs={[
			{
				value: 'account',
				label: 'Account',
				content: () => `<p>Make changes to your account here. Click save when you're done.</p>`
			},
			{
				value: 'password',
				label: 'Password',
				content: () => `<p>Change your password here. After saving, you'll be logged out.</p>`
			}
		]}
	/>
{/snippet}

<Story
	name="Basic"
	template={basicTemplate}
	args={{
		value: 'account'
	}}
/>

{#snippet showcaseTemplate(args)}
	<!-- Showcase example: Prague to Malaga flight tabs -->
	<div class="w-full max-w-md">
		{#snippet pragueTabContent()}
			<div class="space-y-4">
				<div class="flex items-center justify-between">
					<div>
						<h3 class="text-lg font-semibold">Prague</h3>
						<p class="text-sm text-muted-foreground">06:05</p>
					</div>
					<div class="text-center">
						<p class="text-sm font-medium">3h 30m</p>
						<div class="flex items-center justify-center space-x-1 my-2">
							<div class="w-2 h-2 bg-muted rounded-full"></div>
							<div class="w-2 h-2 bg-muted rounded-full"></div>
							<div class="w-2 h-2 bg-muted rounded-full"></div>
						</div>
					</div>
					<div class="text-right">
						<h3 class="text-lg font-semibold">Malaga</h3>
						<p class="text-sm text-muted-foreground">09:35</p>
					</div>
				</div>
			</div>
		{/snippet}

		{#snippet malagaTabContent()}
			<div class="space-y-4">
				<div class="flex items-center justify-between">
					<div>
						<h3 class="text-lg font-semibold">Malaga</h3>
						<p class="text-sm text-muted-foreground">07:25</p>
					</div>
					<div class="text-center">
						<p class="text-sm font-medium">3h 20m</p>
						<div class="flex items-center justify-center space-x-1 my-2">
							<div class="w-2 h-2 bg-muted rounded-full"></div>
							<div class="w-2 h-2 bg-muted rounded-full"></div>
							<div class="w-2 h-2 bg-muted rounded-full"></div>
						</div>
					</div>
					<div class="text-right">
						<h3 class="text-lg font-semibold">Prague</h3>
						<p class="text-sm text-muted-foreground">10:45</p>
					</div>
				</div>
			</div>
		{/snippet}

		<Tabs
			class={args.class}
			listClass={args.listClass}
			triggerClass={args.triggerClass}
			contentClass={args.contentClass}
			bind:value={args.value}
			tabs={[
				{
					value: 'prague-malaga',
					label: 'Outbound',
					content: pragueTabContent
				},
				{
					value: 'malaga-prague',
					label: 'Inbound',
					content: malagaTabContent
				}
			]}
		/>
	</div>
{/snippet}

<Story
	name="Showcase"
	template={showcaseTemplate}
	args={{
		value: 'prague-malaga'
	}}
	parameters={{
		docs: {
			description: {
				story: 'Flight booking tabs inspired by the bits UI example, showing Prague to Malaga flights.'
			}
		}
	}}
/>

{#snippet customStyleTemplate(args)}
	<Tabs
		class="w-full max-w-sm"
		listClass="grid w-full grid-cols-2"
		triggerClass="data-[state=active]:bg-primary data-[state=active]:text-primary-foreground"
		contentClass="mt-6 p-4 border rounded-lg bg-card"
		bind:value={args.value}
		tabs={[
			{
				value: 'personal',
				label: 'Personal',
				content: () => `
					<div class="space-y-4">
						<p class="text-sm text-muted-foreground">
							Information about your personal account and preferences.
						</p>
						<div class="space-y-2">
							<div class="flex items-center space-x-2">
								<div class="w-2 h-2 bg-green-500 rounded-full"></div>
								<span class="text-sm">Profile complete</span>
							</div>
							<div class="flex items-center space-x-2">
								<div class="w-2 h-2 bg-blue-500 rounded-full"></div>
								<span class="text-sm">Email verified</span>
							</div>
						</div>
					</div>
				`
			},
			{
				value: 'business',
				label: 'Business',
				content: () => `
					<div class="space-y-4">
						<p class="text-sm text-muted-foreground">
							Business account details and team management options.
						</p>
						<div class="space-y-2">
							<div class="flex items-center space-x-2">
								<div class="w-2 h-2 bg-purple-500 rounded-full"></div>
								<span class="text-sm">Team of 12 members</span>
							</div>
							<div class="flex items-center space-x-2">
								<div class="w-2 h-2 bg-orange-500 rounded-full"></div>
								<span class="text-sm">Premium features enabled</span>
							</div>
						</div>
					</div>
				`
			}
		]}
	/>
{/snippet}

<Story
	name="Custom Style"
	template={customStyleTemplate}
	args={{
		value: 'personal'
	}}
/>

{#snippet manualActivationTemplate(args)}
	<Tabs
		class={args.class}
		activationMode="manual"
		bind:value={args.value}
		tabs={[
			{
				value: 'tab1',
				label: 'Tab 1',
				content: () => `<p>Content for Tab 1. This tab requires manual activation.</p>`
			},
			{
				value: 'tab2',
				label: 'Tab 2',
				content: () => `<p>Content for Tab 2. Click to activate this tab.</p>`
			},
			{
				value: 'tab3',
				label: 'Tab 3',
				content: () => `<p>Content for Tab 3. Manual activation mode is enabled.</p>`
			}
		]}
	/>
{/snippet}

<Story
	name="Manual Activation"
	template={manualActivationTemplate}
	args={{
		value: 'tab1'
	}}
	parameters={{
		docs: {
			description: {
				story: 'Tabs with manual activation mode. Users must click to activate tabs instead of automatic activation on focus.'
			}
		}
	}}
/>