<script lang="ts">
	import PaginationRoot from './PaginationRoot.svelte'
	import PaginationContent from './PaginationContent.svelte'
	import PaginationPrevButton from './PaginationPrevButton.svelte'
	import PaginationNextButton from './PaginationNextButton.svelte'
	import PaginationPage from './PaginationPage.svelte'
	import type { Props as PaginationRootProps } from './PaginationRoot.svelte'
	import type { Snippet } from 'svelte'

	export type Page = {
		type: 'page'
		value: number
	}

	export type Ellipsis = {
		type: 'ellipsis'
	}

	export type PageItem = (Page | Ellipsis) & {
		key: string
	}

	export type PaginationSnippetProps = {
		pages: PageItem[]
		range: {
			start: number
			end: number
		}
		currentPage: number
	}

	export type Props = PaginationRootProps & {
		class?: string
		contentClass?: string
		prevButtonClass?: string
		nextButtonClass?: string
		pageClass?: string
		children?: Snippet<[PaginationSnippetProps]>
	}

	let {
		class: className,
		contentClass,
		prevButtonClass,
		nextButtonClass,
		pageClass,
		children,
		page = $bindable(),
		onPageChange,
		...props
	}: Props = $props()
</script>

<PaginationRoot {...props} {page} {onPageChange} class={className}>
	{#snippet children(props)}
		{#if children}
			{@render children(props)}
		{:else}
			<PaginationContent class={contentClass}>
				<PaginationPrevButton class={prevButtonClass} />
				{#each props.pages as pageItem (pageItem.key)}
					{#if pageItem.type === 'ellipsis'}
						<div
							class="text-muted-foreground inline-flex h-10 w-10 items-center justify-center text-sm font-medium"
						>
							...
						</div>
					{:else}
						<PaginationPage page={pageItem} class={pageClass}>
							{pageItem.value}
						</PaginationPage>
					{/if}
				{/each}
				<PaginationNextButton class={nextButtonClass} />
			</PaginationContent>
		{/if}
	{/snippet}
</PaginationRoot>
