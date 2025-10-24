# Claude

## Overview

- Run `bun run check` every time before finishing a code change.
- Always use const and arrow functions for defining functions.
- Import path must use `$` alias for `src` directory (e.g., `import { Card } from '$/component/card'`, `import { cn } from '$/lib/utils'`).
- `children` props will type as `Snippet` (import type { Snippet } from 'svelte')
- Other props must name as `...props`
- Order component props from {...props}, class={classes}, other props.
- See `src/component/avatar/{Avatar.svelte,Avatar.stories.svelte}`, `src/component/button/Button.svelte`, `src/component/combobox/Combobox.svelte`, `src/component/dialog/Dialog.svelte` for reference.
- All bindable props must retrieve from `$props`, example from `src/component/dialog/Dialog.svelte`.

## Component Implementation

- Example `src/component/:component/index.ts`

    ```
    import Combobox from './Combobox.svelte'
    import ComboboxRoot from './ComboboxRoot.svelte'
    import '$/style/tailwind.css'

    export {
        Combobox,
        ComboboxRoot,
    }
    ```

- Always use $derived, $derived.by((...) => {...}) for derived stores.
- Always use arrow functions for defining functions.
- Naming of functions must use be
    - `handle<Component><ExtendedComponent><Event>` for event handlers, e.g., handleButtonClick, handlePaginationPageChange
