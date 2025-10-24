<script lang="ts">
	import '../../style/tailwind.css'
	import { Button, type ButtonRootProps } from 'bits-ui'
	import { type Palette } from '../../declaration/palette.ts'
	import { cn } from '../../lib/utils.js'
	import { LoaderCircle } from '@lucide/svelte'

	type Props = ButtonRootProps & {
		/** Additional classes for the button */
		class?: string
		/** Edge style of the button */
		edge?: 'square' | 'round' | 'pill'
		/** Rounded corners size */
		rounded?: 'xs' | 'sm' | 'md' | 'lg' | 'xl'
		/** Button variant style */
		variant?: 'outline' | 'primary' | 'secondary' | 'trinary' | 'subtle' | 'plain'
		/** Button size */
		size?: 'sm' | 'md' | 'lg'
		/** Button contents */
		label: string
		/** Loading state */
		loading?: boolean
		/** Color palette */
		palette?: Palette
	}

	const {
		edge = 'round',
		rounded = 'md',
		variant = 'primary',
		size = 'md',
		label,
		loading = false,
		palette = 'solid',
		class: className,
		children,
		disabled = false,
		...props
	}: Props = $props()

	const isDisabled = $derived(disabled || loading)

	const roundedClasses = {
		xs: 'rounded-xs',
		sm: 'rounded-sm',
		md: 'rounded-md',
		lg: 'rounded-lg',
		xl: 'rounded-xl',
	}

	const edgeClasses = {
		square: 'rounded-none',
		round: roundedClasses[rounded],
		pill: 'rounded-full',
	}

	const sizeClasses = {
		sm: 'px-3 py-1.5 text-sm',
		md: 'px-4 py-2 text-base',
		lg: 'px-6 py-3 text-lg',
	}

	const getVariantClasses = () => {
		switch (variant) {
			case 'outline':
				return `bg-transparent border-2 border-primary text-primary hover:bg-primary hover:text-primary-foreground dark:border-primary dark:text-primary dark:hover:bg-primary dark:hover:text-primary-foreground`
			case 'primary':
				return `bg-primary text-primary-foreground hover:bg-primary/90 dark:bg-primary dark:text-primary-foreground dark:hover:bg-primary/80`
			case 'secondary':
				return `bg-secondary text-secondary-foreground hover:bg-secondary/80 dark:bg-secondary dark:text-secondary-foreground dark:hover:bg-secondary/70`
			case 'trinary':
				return `bg-muted text-muted-foreground border border-transparent hover:border-border hover:bg-background dark:bg-muted dark:text-muted-foreground dark:hover:border-border dark:hover:bg-background`
			case 'subtle':
				return `bg-transparent text-muted-foreground hover:bg-muted dark:text-muted-foreground dark:hover:bg-muted`
			case 'plain':
				return `bg-transparent text-muted-foreground border border-transparent hover:border-border dark:text-muted-foreground dark:hover:border-border`
			default:
				return ''
		}
	}

	const getSizeClasses = () => {
		const baseClasses = sizeClasses[size]
		// For outline variant, reduce padding by 1px on each side to compensate for 2px border
		if (variant === 'outline') {
			if (size === 'sm') return 'px-2.5 py-1 text-sm'
			if (size === 'md') return 'px-3.5 py-1.5 text-base'
			if (size === 'lg') return 'px-5 py-2.5 text-lg'
		}
		return baseClasses
	}

	const buttonClasses = $derived(
		cn(
			'inline-flex items-center justify-center font-medium transition-colors focus:outline-none focus:ring-2 focus:ring-offset-2',
			edgeClasses[edge],
			getSizeClasses(),
			getVariantClasses(),
			isDisabled ? 'cursor-not-allowed opacity-60' : 'cursor-pointer',
			className
		)
	)
</script>

<Button.Root {...props} class={buttonClasses} disabled={isDisabled}>
	{#if loading}
		<LoaderCircle class="mr-2 h-4 w-4 animate-spin" />
	{/if}
	{#if children}
		{@render children()}
	{:else}
		{label}
	{/if}
</Button.Root>
