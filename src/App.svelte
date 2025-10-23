<script lang="ts">
	import Counter from './lib/Counter.svelte'
	import Button from './component/button/Button.svelte'
	import './style/style.scss'
	import './style/tailwind.css'

	let isDark = $state(false)

	function toggleDarkMode() {
		isDark = !isDark
		if (isDark) {
			document.documentElement.classList.add('dark')
		} else {
			document.documentElement.classList.remove('dark')
		}
	}
</script>

<main class="min-h-screen bg-background text-foreground transition-colors">
	<div class="container mx-auto p-4">
		<div class="flex justify-between items-center mb-8">
			<h1 class="text-3xl font-bold">Vite + Svelte</h1>

			<!-- Dark Mode Toggle -->
			<button
				onclick={toggleDarkMode}
				class="p-2 rounded-lg bg-secondary hover:bg-secondary/80 transition-colors"
				aria-label="Toggle dark mode"
			>
				{#if isDark}
					<svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
						<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M12 3v1m0 16v1m9-9h-1M4 12H3m15.364 6.364l-.707-.707M6.343 6.343l-.707-.707m12.728 0l-.707.707M6.343 17.657l-.707.707M16 12a4 4 0 11-8 0 4 4 0 018 0z"></path>
					</svg>
				{:else}
					<svg class="w-6 h-6" fill="none" stroke="currentColor" viewBox="0 0 24 24">
						<path stroke-linecap="round" stroke-linejoin="round" stroke-width="2" d="M20.354 15.354A9 9 0 018.646 3.646 9.003 9.003 0 0012 21a9.003 9.003 0 008.354-5.646z"></path>
					</svg>
				{/if}
			</button>
		</div>

		<div class="card bg-card text-card-foreground p-6 rounded-lg shadow-sm mb-6">
			<Counter />
		</div>

		<!-- Button Components Demo -->
		<div class="bg-card text-card-foreground p-6 rounded-lg shadow-sm mb-6">
			<h2 class="text-xl font-semibold mb-4">Button Components</h2>
			<div class="flex flex-wrap gap-4">
				<Button label="Primary Button" variant="primary" />
				<Button label="Secondary Button" variant="secondary" />
				<Button label="Outline Button" variant="outline" />
				<Button label="Small Button" size="sm" />
				<Button label="Large Button" size="lg" />
			</div>
		</div>
	</div>
</main>
