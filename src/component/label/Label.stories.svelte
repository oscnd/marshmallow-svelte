<script module>
	import { defineMeta } from '@storybook/addon-svelte-csf'
	import { Label } from './index'

	const { Story } = defineMeta({
		title: 'Components/Label',
		component: Label,
		tags: ['autodocs'],
		parameters: {
			docs: {
				controls: {
					include: ['class', 'htmlFor'],
				},
			},
		},
	})
</script>

{#snippet childrenSnippet()}
	Email address
{/snippet}

<Story
	args={{
		children: childrenSnippet,
		htmlFor: 'email',
	}}
	name="Default"
/>

{#snippet customClassSnippet()}
	Username
{/snippet}

<Story
	args={{
		children: customClassSnippet,
		htmlFor: 'username',
		class: 'text-lg text-blue-600',
	}}
	name="With Custom Class"
/>

{#snippet disabledSnippet()}
	Disabled field
{/snippet}

<Story
	args={{
		children: disabledSnippet,
		htmlFor: 'disabled',
		class: 'peer-disabled:opacity-50',
	}}
	name="Disabled"
/>

{#snippet defaultTemplate(args)}
	<div class="space-y-2">
		<Label {...args} />
		<input
			id={args.htmlFor || 'default'}
			type="text"
			class="rounded-md border px-3 py-2"
			placeholder="Enter your email"
		/>
	</div>
{/snippet}

{#snippet withInputSnippet()}
	Email address
{/snippet}

<Story name="With Input" args={{ children: withInputSnippet, htmlFor: 'email' }} template={defaultTemplate} />
