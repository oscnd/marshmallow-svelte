<script lang="ts">
	interface Props {
		/** Is this the principal call to action on the page? */
		primary?: boolean
		/** What background color to use */
		backgroundColor?: string
		/** How large should the button be? */
		size?: 'small' | 'medium' | 'large'
		/** Button contents */
		label: string
		/** The onclick event handler */
		onclick?: () => void
	}

	const { primary = false, backgroundColor, size = 'medium', label, ...props }: Props = $props()

	const sizeClasses = $derived(() => {
		switch (size) {
			case 'small':
				return 'px-3 py-1.5 text-sm'
			case 'large':
				return 'px-6 py-3 text-lg'
			default:
				return 'px-4 py-2 text-base'
		}
	})

	const baseClasses = 'font-semibold rounded-lg transition-colors focus:outline-none focus:ring-2 focus:ring-ring'
	const variantClasses = primary
		? 'bg-primary text-primary-foreground hover:bg-primary/90'
		: 'bg-secondary text-secondary-foreground hover:bg-secondary/80'

	const buttonClasses = $derived(() => `${baseClasses} ${variantClasses} ${sizeClasses()}`)
	const buttonStyle = $derived(backgroundColor ? `background-color: ${backgroundColor}` : '')
</script>

<button
	type="button"
	class={buttonClasses}
	style={buttonStyle}
	{...props}
>
	{label}
</button>
