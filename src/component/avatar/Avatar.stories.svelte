<script module>
	import { defineMeta } from '@storybook/addon-svelte-csf'
	import { Avatar, AvatarImage, AvatarFallback, AvatarGroup } from './index'

	const { Story } = defineMeta({
		title: 'Components/Avatar',
		component: Avatar,
		subcomponents: {
			AvatarImage,
			AvatarFallback,
			AvatarGroup,
		},
		tags: ['autodocs'],
		parameters: {
			docs: {
				controls: {
					include: ['class', 'src', 'firstname', 'lastname', 'fullname', 'border'],
				},
			},
		},
	})
</script>

<Story
	args={{
		firstname: 'John',
		lastname: 'Doe',
	}}
	name="Name only"
/>

<Story
	args={{
		firstname: 'John',
		lastname: 'Doe',
		src: 'https://images.unsplash.com/photo-1492633423870-43d1cd2775eb?&w=256&h=256&dpr=2&q=80',
	}}
	name="With Images"
/>

<Story
	args={{
		firstname: 'John',
		lastname: 'Doe',
		border: true,
	}}
	name="With Border"
/>

<Story
	args={{
		firstname: 'Custom',
		lastname: 'Styled',
		class: 'border-primary border-2',
	}}
	name="Custom Styled"
/>

{#snippet avatarGroupTemplate(args)}
	<AvatarGroup>
		<Avatar src="https://picsum.photos/200/300?salt=1" firstname="John" lastname="Doe" />
		<Avatar src="https://example.com/broken-image.jpg" fullname="Jane Smith" />
		<Avatar firstname="Alice" lastname="Johnson" />
		<Avatar fullname="Bob Wilson" />
	</AvatarGroup>
{/snippet}

<Story name="Avatar Group" template={avatarGroupTemplate} />

{#snippet avatarGroupWithBorderTemplate(args)}
	<AvatarGroup>
		<Avatar src="https://picsum.photos/200/300?salt=2" firstname="John" lastname="Doe" border />
		<Avatar src="https://example.com/broken-image.jpg" fullname="Jane Smith" border />
		<Avatar firstname="Alice" lastname="Johnson" border />
		<Avatar fullname="Bob Wilson" border />
	</AvatarGroup>
{/snippet}

<Story name="Avatar Group with Border" template={avatarGroupWithBorderTemplate} />
