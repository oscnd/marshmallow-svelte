<script module>
	import { defineMeta } from '@storybook/addon-svelte-csf'
	import { Popover, PopoverTrigger, PopoverContent, PopoverClose, PopoverArrow, PopoverPortal } from './index'

	const { Story } = defineMeta({
		title: 'Components/Popover',
		component: Popover,
		subcomponents: {
			PopoverTrigger,
			PopoverContent,
			PopoverClose,
			PopoverArrow,
			PopoverPortal,
		},
		tags: ['autodocs'],
		parameters: {
			docs: {
				controls: {
					include: ['class', 'contentClass', 'triggerClass', 'open'],
				},
			},
		},
	})
</script>

<script>
	import { cn } from '$/lib/utils'
	import { Settings, User, HelpCircle } from '@lucide/svelte'
</script>

{#snippet basicTemplate(args)}
	<div class="flex min-h-96 items-center justify-center">
		<Popover bind:open={args.open}>
			<PopoverTrigger
				class="ring-offset-background focus-visible:ring-ring bg-primary text-primary-foreground hover:bg-primary/90 inline-flex h-10 items-center justify-center rounded-md px-4 py-2 text-sm font-medium transition-colors focus-visible:ring-2 focus-visible:ring-offset-2 focus-visible:outline-none disabled:pointer-events-none disabled:opacity-50"
			>
				Open Popover
			</PopoverTrigger>
			<PopoverContent class="w-80">
				<div class="grid gap-4">
					<div class="space-y-2">
						<h4 class="leading-none font-medium">Dimensions</h4>
						<p class="text-muted-foreground text-sm">Set the dimensions for the layer.</p>
					</div>
					<div class="grid gap-2">
						<div class="grid grid-cols-3 items-center gap-4">
							<label for="width">Width</label>
							<input
								id="width"
								type="text"
								value="100%"
								class="col-span-2 h-8 rounded-md border px-3 py-1 text-sm"
							/>
						</div>
						<div class="grid grid-cols-3 items-center gap-4">
							<label for="maxWidth">Max. width</label>
							<input
								id="maxWidth"
								type="text"
								value="300px"
								class="col-span-2 h-8 rounded-md border px-3 py-1 text-sm"
							/>
						</div>
						<div class="grid grid-cols-3 items-center gap-4">
							<label for="height">Height</label>
							<input
								id="height"
								type="text"
								value="25px"
								class="col-span-2 h-8 rounded-md border px-3 py-1 text-sm"
							/>
						</div>
					</div>
				</div>
			</PopoverContent>
		</Popover>
	</div>
{/snippet}

<Story
	args={{
		open: false,
	}}
	name="Basic"
	template={basicTemplate}
/>

{#snippet showcaseTemplate(args)}
	<div class="flex min-h-96 items-center justify-center">
		<Popover bind:open={args.open}>
			<PopoverTrigger
				class="ring-offset-background focus-visible:ring-ring hover:bg-accent hover:text-accent-foreground inline-flex h-10 w-10 items-center justify-center rounded-full text-sm font-medium transition-colors focus-visible:ring-2 focus-visible:ring-offset-2 focus-visible:outline-none disabled:pointer-events-none disabled:opacity-50"
			>
				<User class="h-4 w-4" />
			</PopoverTrigger>
			<PopoverContent class="w-80" side="bottom" align="center">
				<div class="space-y-4">
					<div class="space-y-2">
						<h3 class="leading-none font-medium">Profile Settings</h3>
						<p class="text-muted-foreground text-sm">Manage your account settings and preferences.</p>
					</div>
					<div class="space-y-3">
						<div class="flex items-center space-x-3">
							<div
								class="flex h-12 w-12 items-center justify-center rounded-full bg-gradient-to-r from-blue-500 to-purple-600"
							>
								<span class="font-semibold text-white">JD</span>
							</div>
							<div class="flex-1">
								<p class="font-medium">John Doe</p>
								<p class="text-muted-foreground text-sm">john.doe@example.com</p>
							</div>
						</div>
						<div class="space-y-2 border-t pt-3">
							<button
								class="ring-offset-background focus-visible:ring-ring bg-secondary text-secondary-foreground hover:bg-secondary/80 inline-flex h-9 w-full items-center justify-center rounded-md px-3 text-sm font-medium transition-colors focus-visible:ring-2 focus-visible:ring-offset-2 focus-visible:outline-none disabled:pointer-events-none disabled:opacity-50"
							>
								<Settings class="mr-2 h-4 w-4" />
								Settings
							</button>
							<button
								class="ring-offset-background focus-visible:ring-ring hover:bg-accent hover:text-accent-foreground inline-flex h-9 w-full items-center justify-center rounded-md px-3 text-sm font-medium transition-colors focus-visible:ring-2 focus-visible:ring-offset-2 focus-visible:outline-none disabled:pointer-events-none disabled:opacity-50"
							>
								<HelpCircle class="mr-2 h-4 w-4" />
								Help & Support
							</button>
						</div>
					</div>
				</div>
			</PopoverContent>
		</Popover>
	</div>
{/snippet}

<Story
	args={{
		open: false,
	}}
	name="Showcase"
	parameters={{
		docs: {
			description: {
				story: 'Profile settings popover inspired by modern UI patterns, featuring user avatar, account information, and quick action buttons.',
			},
		},
	}}
	template={showcaseTemplate}
/>

{#snippet interactiveTemplate(args)}
	<div class="flex min-h-96 items-center justify-center space-x-4">
		<Popover bind:open={args.open}>
			<PopoverTrigger
				class="ring-offset-background focus-visible:ring-ring bg-primary text-primary-foreground hover:bg-primary/90 inline-flex h-10 items-center justify-center rounded-md px-4 py-2 text-sm font-medium transition-colors focus-visible:ring-2 focus-visible:ring-offset-2 focus-visible:outline-none disabled:pointer-events-none disabled:opacity-50"
			>
				Share Document
			</PopoverTrigger>
			<PopoverContent class="w-96">
				<div class="space-y-4">
					<div class="space-y-2">
						<h4 class="leading-none font-medium">Share with others</h4>
						<p class="text-muted-foreground text-sm">Enter email addresses to share this document.</p>
					</div>
					<div class="space-y-3">
						<div class="flex space-x-2">
							<input
								type="email"
								placeholder="Enter email address"
								class="border-input placeholder:text-muted-foreground focus-visible:ring-ring flex h-9 w-full rounded-md border bg-transparent px-3 py-1 text-sm shadow-sm transition-colors file:border-0 file:bg-transparent file:text-sm file:font-medium focus-visible:ring-1 focus-visible:outline-none disabled:cursor-not-allowed disabled:opacity-50"
							/>
							<button
								class="ring-offset-background focus-visible:ring-ring bg-primary text-primary-foreground hover:bg-primary/90 inline-flex h-9 items-center justify-center rounded-md px-3 text-sm font-medium transition-colors focus-visible:ring-2 focus-visible:ring-offset-2 focus-visible:outline-none disabled:pointer-events-none disabled:opacity-50"
							>
								Add
							</button>
						</div>
						<div class="space-y-2">
							<div class="flex items-center justify-between rounded-md border p-2">
								<div class="flex items-center space-x-2">
									<div class="flex h-6 w-6 items-center justify-center rounded-full bg-blue-100">
										<span class="text-xs font-medium text-blue-600">A</span>
									</div>
									<span class="text-sm">alice@example.com</span>
								</div>
								<select class="rounded border px-2 py-1 text-sm">
									<option>Can edit</option>
									<option>Can view</option>
								</select>
							</div>
						</div>
						<div class="flex items-center space-x-2 pt-2">
							<input type="checkbox" id="notify" class="rounded border-gray-300" />
							<label for="notify" class="text-sm">Notify people via email</label>
						</div>
					</div>
				</div>
			</PopoverContent>
		</Popover>
	</div>
{/snippet}

<Story
	args={{
		open: false,
	}}
	name="Interactive Form"
	parameters={{
		docs: {
			description: {
				story: 'Interactive popover with a form for sharing documents, demonstrating complex interactions within a popover.',
			},
		},
	}}
	template={interactiveTemplate}
/>

{#snippet placementTemplate(args)}
	<div class="grid min-h-96 grid-cols-3 items-center justify-center gap-8">
		<Popover>
			<PopoverTrigger
				class="ring-offset-background focus-visible:ring-ring bg-primary text-primary-foreground hover:bg-primary/90 inline-flex h-10 items-center justify-center rounded-md px-4 py-2 text-sm font-medium transition-colors focus-visible:ring-2 focus-visible:ring-offset-2 focus-visible:outline-none disabled:pointer-events-none disabled:opacity-50"
			>
				Top
			</PopoverTrigger>
			<PopoverContent side="top">
				<p class="text-sm">Popover positioned at the top</p>
			</PopoverContent>
		</Popover>

		<Popover>
			<PopoverTrigger
				class="ring-offset-background focus-visible:ring-ring bg-primary text-primary-foreground hover:bg-primary/90 inline-flex h-10 items-center justify-center rounded-md px-4 py-2 text-sm font-medium transition-colors focus-visible:ring-2 focus-visible:ring-offset-2 focus-visible:outline-none disabled:pointer-events-none disabled:opacity-50"
			>
				Right
			</PopoverTrigger>
			<PopoverContent side="right">
				<p class="text-sm">Popover positioned on the right</p>
			</PopoverContent>
		</Popover>

		<Popover>
			<PopoverTrigger
				class="ring-offset-background focus-visible:ring-ring bg-primary text-primary-foreground hover:bg-primary/90 inline-flex h-10 items-center justify-center rounded-md px-4 py-2 text-sm font-medium transition-colors focus-visible:ring-2 focus-visible:ring-offset-2 focus-visible:outline-none disabled:pointer-events-none disabled:opacity-50"
			>
				Bottom
			</PopoverTrigger>
			<PopoverContent side="bottom">
				<p class="text-sm">Popover positioned at the bottom</p>
			</PopoverContent>
		</Popover>
	</div>
{/snippet}

<Story
	args={{
		open: false,
	}}
	name="Placement"
	parameters={{
		docs: {
			description: {
				story: 'Popover positioning examples showing different placement options (top, right, bottom).',
			},
		},
	}}
	template={placementTemplate}
/>

{#snippet arrowTemplate(args)}
	<div class="flex min-h-96 items-center justify-center">
		<Popover>
			<PopoverTrigger
				class="ring-offset-background focus-visible:ring-ring bg-primary text-primary-foreground hover:bg-primary/90 inline-flex h-10 items-center justify-center rounded-md px-4 py-2 text-sm font-medium transition-colors focus-visible:ring-2 focus-visible:ring-offset-2 focus-visible:outline-none disabled:pointer-events-none disabled:opacity-50"
			>
				Popover with Arrow
			</PopoverTrigger>
			<PopoverContent side="bottom" align="center">
				<PopoverArrow class="text-border" />
				<div class="space-y-2">
					<h4 class="leading-none font-medium">With Arrow</h4>
					<p class="text-muted-foreground text-sm">
						This popover has an arrow pointing to the trigger element.
					</p>
				</div>
			</PopoverContent>
		</Popover>
	</div>
{/snippet}

<Story
	args={{
		open: false,
	}}
	name="With Arrow"
	parameters={{
		docs: {
			description: {
				story: 'Popover with an arrow component that points to the trigger element.',
			},
		},
	}}
	template={arrowTemplate}
/>

{#snippet offsetTemplate(args)}
	<div class="flex min-h-96 items-center justify-center space-x-8">
		<div class="space-y-4">
			<Popover>
				<PopoverTrigger
					class="ring-offset-background focus-visible:ring-ring bg-primary text-primary-foreground hover:bg-primary/90 inline-flex h-10 items-center justify-center rounded-md px-4 py-2 text-sm font-medium transition-colors focus-visible:ring-2 focus-visible:ring-offset-2 focus-visible:outline-none disabled:pointer-events-none disabled:opacity-50"
				>
					Default Position
				</PopoverTrigger>
				<PopoverContent side="bottom" align="center">
					<div class="space-y-2">
						<h4 class="leading-none font-medium">Default Offset</h4>
						<p class="text-muted-foreground text-sm">This popover uses the default offset distance.</p>
					</div>
				</PopoverContent>
			</Popover>
		</div>

		<div class="space-y-4">
			<Popover>
				<PopoverTrigger
					class="ring-offset-background focus-visible:ring-ring bg-primary text-primary-foreground hover:bg-primary/90 inline-flex h-10 items-center justify-center rounded-md px-4 py-2 text-sm font-medium transition-colors focus-visible:ring-2 focus-visible:ring-offset-2 focus-visible:outline-none disabled:pointer-events-none disabled:opacity-50"
				>
					Offset: 10
				</PopoverTrigger>
				<PopoverContent side="bottom" align="center" sideOffset={10}>
					<div class="space-y-2">
						<h4 class="leading-none font-medium">Offset: 10</h4>
						<p class="text-muted-foreground text-sm">This popover has a 10px offset from the trigger.</p>
					</div>
				</PopoverContent>
			</Popover>
		</div>

		<div class="space-y-4">
			<Popover>
				<PopoverTrigger
					class="ring-offset-background focus-visible:ring-ring bg-primary text-primary-foreground hover:bg-primary/90 inline-flex h-10 items-center justify-center rounded-md px-4 py-2 text-sm font-medium transition-colors focus-visible:ring-2 focus-visible:ring-offset-2 focus-visible:outline-none disabled:pointer-events-none disabled:opacity-50"
				>
					Offset: 20
				</PopoverTrigger>
				<PopoverContent side="bottom" align="center" sideOffset={20}>
					<div class="space-y-2">
						<h4 class="leading-none font-medium">Offset: 20</h4>
						<p class="text-muted-foreground text-sm">This popover has a 20px offset from the trigger.</p>
					</div>
				</PopoverContent>
			</Popover>
		</div>
	</div>
{/snippet}

<Story
	args={{
		open: false,
	}}
	name="Offset"
	parameters={{
		docs: {
			description: {
				story: 'Popover with different offset values to control the distance between the popover and its trigger element.',
			},
		},
	}}
	template={offsetTemplate}
/>
