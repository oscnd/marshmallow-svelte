<script module>
	import { defineMeta } from '@storybook/addon-svelte-csf'
	import Button from './Button.svelte'
	import { fn } from '@storybook/test'

	const { Story } = defineMeta({
		title: 'Components/Button',
		component: Button,
		tags: ['autodocs'],
		argTypes: {
			edge: {
				control: { type: 'select' },
				options: ['square', 'round', 'pill'],
			},
			rounded: {
				control: { type: 'select' },
				options: ['xs', 'sm', 'md', 'lg', 'xl'],
			},
			variant: {
				control: { type: 'select' },
				options: ['outline', 'primary', 'secondary', 'trinary', 'subtle', 'plain'],
			},
			size: {
				control: { type: 'select' },
				options: ['sm', 'md', 'lg'],
			},
			label: {
				control: { type: 'text' },
			},
			loading: {
				control: { type: 'boolean' },
			},
			disabled: {
				control: { type: 'boolean' },
			},
			palette: {
				control: { type: 'select' },
				options: ['danger', 'confirm', 'warning', 'solid'],
			},
			href: {
				control: { type: 'text' },
			},
			target: {
				control: { type: 'text' },
			},
			rel: {
				control: { type: 'text' },
			},
			type: {
				control: { type: 'select' },
				options: ['button', 'submit', 'reset'],
			},
			name: {
				control: { type: 'text' },
			},
			value: {
				control: { type: 'text' },
			},
			autofocus: {
				control: { type: 'boolean' },
			},
		},
		args: {
			onclick: fn(),
		},
	})
</script>

<!-- Variants -->
<Story name="Primary" args={{ variant: 'primary', label: 'Primary Button' }} />

<Story name="Secondary" args={{ variant: 'secondary', label: 'Secondary Button' }} />

<Story name="Outline" args={{ variant: 'outline', label: 'Outline Button' }} />

<Story name="Trinary" args={{ variant: 'trinary', label: 'Trinary Button' }} />

<Story name="Subtle" args={{ variant: 'subtle', label: 'Subtle Button' }} />

<Story name="Plain" args={{ variant: 'plain', label: 'Plain Button' }} />

<!-- Sizes -->
<Story name="Small" args={{ size: 'sm', label: 'Small Button' }} />

<Story name="Medium" args={{ size: 'md', label: 'Medium Button' }} />

<Story name="Large" args={{ size: 'lg', label: 'Large Button' }} />

<!-- Edge Styles -->
<Story name="Square" args={{ edge: 'square', label: 'Square Button' }} />

<Story name="Round" args={{ edge: 'round', label: 'Round Button' }} />

<Story name="Pill" args={{ edge: 'pill', label: 'Pill Button' }} />

<!-- Rounded Sizes -->
<Story name="Rounded XS" args={{ edge: 'round', rounded: 'xs', label: 'Rounded XS' }} />

<Story name="Rounded SM" args={{ edge: 'round', rounded: 'sm', label: 'Rounded SM' }} />

<Story name="Rounded MD" args={{ edge: 'round', rounded: 'md', label: 'Rounded MD' }} />

<Story name="Rounded LG" args={{ edge: 'round', rounded: 'lg', label: 'Rounded LG' }} />

<Story name="Rounded XL" args={{ edge: 'round', rounded: 'xl', label: 'Rounded XL' }} />

<!-- Palettes -->
<Story name="Danger" args={{ variant: 'primary', palette: 'danger', label: 'Danger Button' }} />

<Story name="Confirm" args={{ variant: 'primary', palette: 'confirm', label: 'Confirm Button' }} />

<Story name="Warning" args={{ variant: 'primary', palette: 'warning', label: 'Warning Button' }} />

<Story name="Solid" args={{ variant: 'primary', palette: 'solid', label: 'Solid Button' }} />

<!-- States -->
<Story name="Loading" args={{ loading: true, label: 'Loading Button' }} />

<Story name="Disabled" args={{ disabled: true, label: 'Disabled Button' }} />

<!-- Button Types -->
<Story name="Submit" args={{ type: 'submit', label: 'Submit Button' }} />

<Story name="Reset" args={{ type: 'reset', label: 'Reset Button' }} />

<Story name="With Name and Value" args={{ name: 'action', value: 'click', label: 'Named Button' }} />

<!-- Link Button -->
<Story name="Link Button" args={{ href: '#', label: 'Link Button' }} />

<Story name="External Link" args={{ href: 'https://example.com', target: '_blank', rel: 'noopener noreferrer', label: 'External Link' }} />

<!-- With Custom Class -->
<Story name="Custom Class" args={{ label: 'Custom Styled Button' }} />

