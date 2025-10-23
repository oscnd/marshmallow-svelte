<script lang="ts">
    import '../../style/tailwind.css'
    import {Button as BitsButton, type ButtonRootProps} from 'bits-ui'
    import {type Palette} from '../../declaration/palette.ts'
    import {cn} from '../../lib/utils.js'
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
        ...bitsProps
    }: Props = $props()

    const isDisabled = $derived(disabled || loading)

    const roundedClasses = {
        xs: 'rounded-xs',
        sm: 'rounded-sm',
        md: 'rounded-md',
        lg: 'rounded-lg',
        xl: 'rounded-xl'
    }

    const edgeClasses = {
        square: 'rounded-none',
        round: roundedClasses[rounded],
        pill: 'rounded-full'
    }

    const sizeClasses = {
        sm: 'px-3 py-1.5 text-sm',
        md: 'px-4 py-2 text-base',
        lg: 'px-6 py-3 text-lg'
    }

    const getVariantClasses = () => {
        switch (variant) {
            case 'outline':
                return `bg-transparent border-2 ${isDisabled ? 'border-gray-300 text-gray-400' : `border-${palette}-500 text-${palette}-500 hover:bg-${palette}-500 hover:text-white`}`
            case 'primary':
                return `bg-black text-white ${isDisabled ? 'opacity-50 cursor-not-allowed' : `hover:bg-${palette}-600`}`
            case 'secondary':
                return `bg-gray-200 text-gray-800 ${isDisabled ? 'opacity-50 cursor-not-allowed' : 'hover:bg-gray-300'}`
            case 'trinary':
                return `bg-gray-100 text-gray-700 border border-transparent ${isDisabled ? 'opacity-50 cursor-not-allowed' : 'hover:border-gray-300 hover:bg-white'}`
            case 'subtle':
                return `bg-transparent text-gray-600 ${isDisabled ? 'opacity-50 cursor-not-allowed' : 'hover:bg-gray-100'}`
            case 'plain':
                return `bg-transparent text-gray-600 border border-transparent ${isDisabled ? 'opacity-50 cursor-not-allowed' : 'hover:border-gray-300'}`
            default:
                return ''
        }
    }

    const buttonClasses = $derived(
        cn(
            'inline-flex items-center justify-center font-medium transition-colors focus:outline-none focus:ring-2 focus:ring-offset-2',
            edgeClasses[edge],
            sizeClasses[size],
            getVariantClasses(),
            isDisabled ? 'cursor-not-allowed opacity-60' : 'cursor-pointer',
            className
        )
    )
</script>

<BitsButton.Root
        {...bitsProps}
        class={buttonClasses}
        disabled={isDisabled}
>
    {#if loading}
        <LoaderCircle class="mr-2 h-4 w-4 animate-spin" />
    {/if}
    {#if children}
        {@render children()}
    {:else}
        {label}
    {/if}
</BitsButton.Root>
