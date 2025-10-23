<script module>
	import { defineMeta } from '@storybook/addon-svelte-csf'
	import Button from './Button.svelte'

	const { Story } = defineMeta({
		title: 'Components/Button',
		component: Button,
		tags: ['autodocs'],
		argTypes: {
			backgroundColor: { control: 'color' },
			size: {
				control: { type: 'select' },
				options: ['small', 'medium', 'large'],
			},
			primary: {
				control: { type: 'boolean' },
			},
			label: {
				control: { type: 'text' },
			},
		},
	})
</script>

<Story name="Primary" args={{ primary: true, label: 'Primary Button' }} />

<Story name="Secondary" args={{ label: 'Secondary Button' }} />

<Story name="Large" args={{ size: 'large', label: 'Large Button' }} />

<Story name="Medium" args={{ size: 'medium', label: 'Medium Button' }} />

<Story name="Small" args={{ size: 'small', label: 'Small Button' }} />

<Story name="Custom Background" args={{ backgroundColor: '#ff6b6b', label: 'Custom Color' }} />