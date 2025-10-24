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
- Use @lucide-svelte for icons, e.g., `import { UserIcon } from '@lucide/svelte'`

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
- Import of primitive components from bits-ui must not change, e.g., `import { Button } from '$/lib/bits-ui/button'`
- Always follow naming conventions and patterns from other implemented components.

## Inspection

- Use chrome devtools for open storybook or reference pages, also use take_screenshot to see visual changes.
- Try to click and interact with components to see if there is any unexpected behavior.
- Use storybook url: http://localhost:6006/iframe.html?globals=&id=components-checkbox--indeterminate&viewMode=story,
  change `checkbox` to component name and `indeterminate` to story name.
- Any take_screenshot must write to `.local` directory.