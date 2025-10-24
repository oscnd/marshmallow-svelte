<script module>
	import { defineMeta } from '@storybook/addon-svelte-csf'
	import { Pagination } from './index'
    import '$/style/style.scss'

	const { Story } = defineMeta({
		title: 'Components/Pagination',
		component: Pagination,
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

<script lang="ts">
	import type { Args } from 'storybook/internal/csf'

	let currentPage = $state(3)
	let perPage = $state(10)
	let total = $state(100)

	const totalPages = $derived(Math.ceil(total / perPage))
	const startIndex = $derived((currentPage - 1) * perPage + 1)
	const endIndex = $derived(Math.min(currentPage * perPage, total))

	const handlePageChange = (value: number): void => {
		currentPage = value
	}

	const handlePaginationChange = (event: Event): void => {
		const select = event.target as HTMLSelectElement
		perPage = parseInt(select.value)
		currentPage = 1
	}
</script>

{#snippet basicTemplate(args: Args)}
	<Pagination count={args.count} perPage={args.perPage} siblingCount={args.siblingCount} loop={args.loop} />
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

{#snippet loopTemplate(args: Args)}
	<Pagination count={args.count} perPage={args.perPage} siblingCount={args.siblingCount} loop={args.loop} />
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

{#snippet styledTemplate(args: Args)}
	<Pagination
		count={args.count}
		perPage={args.perPage}
		siblingCount={args.siblingCount}
		class="space-y-4"
		contentClass="flex gap-2"
		prevButtonClass="bg-secondary text-secondary-foreground hover:bg-secondary/80"
		nextButtonClass="bg-secondary text-secondary-foreground hover:bg-secondary/80"
		pageClass="flex h-8 w-8 items-center justify-center"
	/>
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

{#snippet bindableTemplate(args: Args)}
		<div class="rounded border border-gray-200 p-4 space-y-2 text-sm text-gray-600">
			<div>Show: <span class="story-code">{startIndex} - {endIndex} / {total}</span></div>
			<div>Page: <span class="story-code">{currentPage}</span></div>
			<div>Total pages: <span class="story-code">{totalPages}</span></div>
			<div class="flex items-center gap-2">
				<label for="items-per-page">Items per page:</label>
				<select
					id="items-per-page"
					bind:value={perPage}
					onchange={handlePaginationChange}
					class="rounded border border-gray-300 px-2"
				>
					<option value={5}>5</option>
					<option value={10}>10</option>
					<option value={20}>20</option>
					<option value={50}>50</option>
				</select>
			</div>
		</div>

		<Pagination
			count={total}
			{perPage}
			siblingCount={2}
			loop={true}
			bind:page={currentPage}
			onPageChange={handlePageChange}
			class="mt-4"
		/>
{/snippet}

<Story
	args={{
		count: 100,
		perPage: 10,
		siblingCount: 2,
		loop: true,
	}}
	name="With Bindable State"
	template={bindableTemplate}
/>
