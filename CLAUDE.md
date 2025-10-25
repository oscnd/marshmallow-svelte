# Claude

## Overview

- Run `bun run check` every time before finishing a code change.
- Always use const and arrow functions for defining functions.
- Import path must use `$` alias for `src` directory (e.g., `import { Card } from '$/component/card'`, `import { cn } from '$/lib/utils'`).
- Other props must name as `...props`
- Order component props from {...props}, class={classes}, other props.
- See `src/component/avatar/{Avatar.svelte,Avatar.stories.svelte}`, `src/component/button/Button.svelte`, `src/component/combobox/Combobox.svelte`, `src/component/dialog/Dialog.svelte` for reference.
- All bindable props must retrieve from `$props`, example from `src/component/dialog/Dialog.svelte`.
- Use @lucide-svelte for icons, e.g., `import { UserIcon } from '@lucide/svelte'`

## Component Implementation

- Example component index `src/component/:component/index.ts`

    ```
    import Combobox from './Combobox.svelte'
    import ComboboxRoot from './ComboboxRoot.svelte'
    import '$/style/tailwind.css'

    export {
        Combobox,
        ComboboxRoot,
    }
    ```

- Default component props

    ```
    export type Props = CalendarHeadCellProps & {
    	/** Children */
    	children?: Snippet
    }
    ```

    - Do not add other props if not directly used in the component
    - If classname added in the component, use `const classes = cn(...)`, otherwise no need to define class prop.
    - `children` props will type as `Snippet` (import type { Snippet } from 'svelte')

- Main components should only orchestrate and pass class props to subcomponents, not contain derived classes.
- All derived classes and styling logic must be handled within individual subcomponents themselves.
- Each subcomponent uses `const classes = $derived(cn(className, 'additiona-class'))` pattern.
- Always use $derived, $derived.by((...) => {...}) for derived stores.
- Always use arrow functions for defining functions.
- Naming of functions must use be
    - `handle<Component><ExtendedComponent><Event>` for event handlers, e.g., handleButtonClick, handlePaginationPageChange
- Import of primitive components from bits-ui must not rename the import name, e.g., `import { Calendar } from 'bits-ui'` and use as `<Calendar.Root />` `<Calendar.Day />` etc.
- Always use `const classes = $derived(cn(...))` for consistent variable naming, not component-specific names like `rootClasses` `buttonClasses`.
- Always follow naming conventions and patterns from other implemented components.

## Inspection

- Use chrome devtools for open storybook or reference pages, also use take_screenshot to see visual changes.
- Try to click and interact with components to see if there is any unexpected behavior.
- Use storybook url: http://localhost:6006/iframe.html?globals=&id=components-checkbox--indeterminate&viewMode=story,
  change `checkbox` to component name and `indeterminate` to story name.
- Use screenshot for visual only, do not write to file.

# Learning

Every time I tell to fix naming or conventions, summarize into single line and write into this CLAUDE.md.

Styling guidelines:

- Write in appropriate sections above (Overview, etc.), NOT in Learning section
- Use same concise format as existing guideline, no bold formatting, simple bullet points
- Keep statements brief and actionable like existing documentation
- Match tone and structure of other guidelines in the same section
- Don't use emphasis words or detailed explanations
- Follow pattern: "Do this" or "Always use X" not "MISTAKE: X CORRECT: Y"
