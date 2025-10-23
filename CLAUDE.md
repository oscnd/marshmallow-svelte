# Claude

## Overview

- Run `bun run check` every time before finishing a code change.
- Always use const and arrow functions for defining functions.
- Import path must use `$` alias for `src` directory (e.g., `import { Card } from '$/component/card'`).
- `children` props will type as `Snippet` (import type { Snippet } from 'svelte')
- Other props must name as `...props`
- Order component props from {...props}, class={classes}, other props.
