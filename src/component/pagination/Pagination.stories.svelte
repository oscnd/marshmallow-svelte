<script module>
	import { defineMeta } from '@storybook/addon-svelte-csf'
	import {
		PaginationRoot,
		PaginationContent,
		PaginationPage,
		PaginationPrevButton,
		PaginationNextButton,
	} from './index'

	const { Story } = defineMeta({
		title: 'Components/Pagination',
		component: PaginationRoot,
		subcomponents: {
			PaginationContent,
			PaginationPage,
			PaginationPrevButton,
			PaginationNextButton,
		},
		tags: ['autodocs'],
		parameters: {
			docs: {
				controls: {
					include: ['class', 'count', 'perPage', 'siblingCount', 'loop'],
				},
			},
		},
	})
</script>

{#snippet basicTemplate(args)}
	<PaginationRoot count={args.count} perPage={args.perPage} siblingCount={args.siblingCount} loop={args.loop}>
		{#snippet children(props)}
			<PaginationContent>
				<PaginationPrevButton />
				{#each props.pages as page (page.key)}
					{#if page.type === 'ellipsis'}
						<div
							class="text-muted-foreground inline-flex h-10 w-10 items-center justify-center text-sm font-medium"
						>
							...
						</div>
					{:else}
						<PaginationPage {page}>
							{page.value}
						</PaginationPage>
					{/if}
				{/each}
				<PaginationNextButton />
			</PaginationContent>
		{/snippet}
	</PaginationRoot>
{/snippet}

<Story
	args={{
		count: 100,
		perPage: 10,
		siblingCount: 1,
		loop: false,
	}}
	name="Basic"
	template={basicTemplate}
/>

{#snippet loopTemplate(args)}
	<PaginationRoot count={args.count} perPage={args.perPage} siblingCount={args.siblingCount} loop={args.loop}>
		{#snippet children({ pages })}
			<PaginationContent>
				<PaginationPrevButton />
				{#each pages as page (page.key)}
					{#if page.type === 'ellipsis'}
						<div
							class="text-muted-foreground inline-flex h-10 w-10 items-center justify-center text-sm font-medium"
						>
							...
						</div>
					{:else}
						<PaginationPage {page}>
							{#snippet children()}
								{page.value}
							{/snippet}
						</PaginationPage>
					{/if}
				{/each}
				<PaginationNextButton />
			</PaginationContent>
		{/snippet}
	</PaginationRoot>
{/snippet}

<Story
	args={{
		count: 50,
		perPage: 5,
		siblingCount: 1,
		loop: true,
	}}
	name="With Loop"
	template={loopTemplate}
/>

{#snippet styledTemplate(args)}
	<PaginationRoot count={args.count} perPage={args.perPage} siblingCount={args.siblingCount} class="space-y-4">
		{#snippet children({ pages })}
			<PaginationContent class="flex gap-2">
				<PaginationPrevButton class="bg-secondary text-secondary-foreground hover:bg-secondary/80" />
				{#each pages as page (page.key)}
					{#if page.type === 'ellipsis'}
						<div
							class="text-muted-foreground inline-flex h-8 w-8 items-center justify-center text-sm font-medium"
						>
							...
						</div>
					{:else}
						<PaginationPage {page}>
							{#snippet children()}
								<span class="flex h-8 w-8 items-center justify-center">
									{page.value}
								</span>
							{/snippet}
						</PaginationPage>
					{/if}
				{/each}
				<PaginationNextButton class="bg-secondary text-secondary-foreground hover:bg-secondary/80" />
			</PaginationContent>
		{/snippet}
	</PaginationRoot>
{/snippet}

<Story
	args={{
		count: 75,
		perPage: 10,
		siblingCount: 1,
		loop: false,
	}}
	name="Custom Styled"
	template={styledTemplate}
/>
