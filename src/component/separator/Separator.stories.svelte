<script module>
	import { defineMeta } from '@storybook/addon-svelte-csf'
	import { Separator, SeparatorRoot } from './index'

	const { Story } = defineMeta({
		title: 'Components/Separator',
		component: Separator,
		subcomponents: {
			SeparatorRoot,
		},
		tags: ['autodocs'],
		parameters: {
			docs: {
				controls: {
					include: ['class', 'orientation', 'decorative'],
				},
			},
		},
	})
</script>

<script>
	import { cn } from '$/lib/utils.js'
</script>

{#snippet basicTemplate(args)}
	<div class="space-y-2">
		<p>Content above separator</p>
		<Separator class={args.class} orientation={args.orientation} decorative={args.decorative} />
		<p>Content below separator</p>
	</div>
{/snippet}

<Story
	args={{
		orientation: 'horizontal',
		decorative: false,
	}}
	name="Basic"
	template={basicTemplate}
/>

{#snippet showcaseTemplate(args)}
	<!-- Exact example from Bits UI documentation -->
	<div class="w-full max-w-sm">
		<div class="space-y-1">
			<h4 class="font-semibold">Bits UI</h4>
			<p class="text-muted-foreground text-sm">Headless UI components for Svelte.</p>
		</div>
		<Separator
			class={cn(
				'my-4 shrink-0 data-[orientation=horizontal]:h-px data-[orientation=horizontal]:w-full data-[orientation=vertical]:h-full data-[orientation=vertical]:w-[1px]',
				args.class
			)}
			orientation={args.orientation}
			decorative={args.decorative}
		/>
		<div class="flex h-5 items-center space-x-4 text-sm">
			<div>Blog</div>
			<Separator
				orientation="vertical"
				class={cn(
					'my-4 shrink-0 data-[orientation=horizontal]:h-px data-[orientation=horizontal]:w-full data-[orientation=vertical]:h-full data-[orientation=vertical]:w-[1px]',
					args.class
				)}
				decorative={args.decorative}
			/>
			<div>Docs</div>
			<Separator
				orientation="vertical"
				class={cn(
					'my-4 shrink-0 data-[orientation=horizontal]:h-px data-[orientation=horizontal]:w-full data-[orientation=vertical]:h-full data-[orientation=vertical]:w-[1px]',
					args.class
				)}
				decorative={args.decorative}
			/>
			<div>Source</div>
		</div>
	</div>
{/snippet}

<Story
	args={{
		orientation: 'horizontal',
		decorative: true,
	}}
	name="Showcase"
	template={showcaseTemplate}
/>

{#snippet decorativeTemplate(args)}
	<div class="space-y-4">
		<p>Separator with decorative prop (won't be announced by screen readers):</p>
		<Separator class={args.class} orientation={args.orientation} decorative={true} />
		<p>Separator without decorative prop (will be announced by screen readers as a separator):</p>
		<Separator class={args.class} orientation={args.orientation} decorative={false} />
	</div>
{/snippet}

<Story
	args={{
		orientation: 'horizontal',
		decorative: true,
	}}
	name="Decorative vs Non-decorative"
	parameters={{
		docs: {
			description: {
				story: 'Shows the difference between decorative and non-decorative separators. Decorative separators are hidden from screen readers, while non-decorative ones are announced as semantic separators.',
			},
		},
	}}
	template={decorativeTemplate}
/>

{#snippet navigationTemplate(args)}
	<nav class="flex items-center space-x-4 text-sm">
		<button class="hover:text-primary cursor-pointer font-medium">Home</button>
		<Separator orientation="vertical" class={cn('h-4', args.class)} decorative={args.decorative} />
		<button class="hover:text-primary cursor-pointer">Products</button>
		<Separator orientation="vertical" class={cn('h-4', args.class)} decorative={args.decorative} />
		<button class="hover:text-primary cursor-pointer">About</button>
		<Separator orientation="vertical" class={cn('h-4', args.class)} decorative={args.decorative} />
		<button class="hover:text-primary cursor-pointer">Contact</button>
	</nav>
{/snippet}

<Story
	args={{
		orientation: 'vertical',
		decorative: true,
	}}
	name="Navigation"
	template={navigationTemplate}
/>

{#snippet sidebarTemplate(args)}
	<div class="flex w-full max-w-md">
		<aside class="w-48 space-y-4">
			<div class="space-y-2">
				<h3 class="font-semibold">Settings</h3>
				<div class="space-y-1 text-sm">
					<div class="hover:text-primary cursor-pointer">Profile</div>
					<div class="hover:text-primary cursor-pointer">Account</div>
					<div class="hover:text-primary cursor-pointer">Security</div>
				</div>
			</div>
			<Separator class={args.class} orientation={args.orientation} decorative={args.decorative} />
			<div class="space-y-2">
				<h3 class="font-semibold">Preferences</h3>
				<div class="space-y-1 text-sm">
					<div class="hover:text-primary cursor-pointer">Appearance</div>
					<div class="hover:text-primary cursor-pointer">Notifications</div>
					<div class="hover:text-primary cursor-pointer">Language</div>
				</div>
			</div>
		</aside>
		<Separator orientation="vertical" class={cn('mx-4 h-auto', args.class)} decorative={args.decorative} />
		<main class="flex-1">
			<div class="space-y-4">
				<h3 class="font-semibold">Content Area</h3>
				<p class="text-muted-foreground text-sm">This is the main content area separated from the sidebar.</p>
				<Separator class={args.class} orientation={args.orientation} decorative={args.decorative} />
				<p class="text-muted-foreground text-sm">Additional content below the separator.</p>
			</div>
		</main>
	</div>
{/snippet}

<Story
	args={{
		orientation: 'horizontal',
		decorative: true,
	}}
	name="Sidebar Layout"
	template={sidebarTemplate}
/>

{#snippet customStyleTemplate(args)}
	<div class="space-y-6">
		<div class="space-y-2">
			<p class="text-sm font-medium">Thick separator:</p>
			<Separator
				class={cn('h-2 bg-gradient-to-r from-blue-500 to-purple-500', args.class)}
				orientation={args.orientation}
				decorative={args.decorative}
			/>
		</div>

		<div class="space-y-2">
			<p class="text-sm font-medium">Dashed separator:</p>
			<Separator
				class={cn('border-2 border-dashed border-gray-300 bg-transparent', args.class)}
				orientation={args.orientation}
				decorative={args.decorative}
			/>
		</div>

		<div class="space-y-2">
			<p class="text-sm font-medium">Custom vertical separator:</p>
			<div class="flex items-center space-x-4">
				<span>Left</span>
				<Separator
					orientation="vertical"
					class={cn('w-1 bg-gradient-to-b from-red-500 to-orange-500', args.class)}
					decorative={args.decorative}
				/>
				<span>Right</span>
			</div>
		</div>
	</div>
{/snippet}

<Story
	args={{
		orientation: 'horizontal',
		decorative: true,
	}}
	name="Custom Styles"
	template={customStyleTemplate}
/>
