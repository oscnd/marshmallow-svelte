<script lang="ts">
    import Counter from './lib/Counter.svelte'
    import './style/style.scss'
    import './style/tailwind.css'
</script>

<main>
    <h1>Vite + Svelte</h1>

    <div class="card p-2">
        <Counter/>
    </div>

    <p>
        Check out <a href="https://github.com/sveltejs/kit#readme" rel="noreferrer" target="_blank">SvelteKit</a>, the
        official Svelte app framework powered by Vite!
    </p>

    <p class="read-the-docs">Click on the Vite and Svelte logos to learn more</p>
</main>
