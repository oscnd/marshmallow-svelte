<script module>
    import {defineMeta} from '@storybook/addon-svelte-csf'
    import {Popover, PopoverTrigger, PopoverContent, PopoverClose, PopoverArrow, PopoverPortal} from './index'

    const {Story} = defineMeta({
        title: 'Components/Popover',
        component: Popover,
        subcomponents: {
            PopoverTrigger,
            PopoverContent,
            PopoverClose,
            PopoverArrow,
            PopoverPortal,
        },
        tags: ['autodocs'],
        parameters: {
            docs: {
                controls: {
                    include: ['class', 'contentClass', 'triggerClass', 'open'],
                },
            },
        },
    })
</script>

<script>
    import {cn} from '$/lib/utils'
    import {Settings, User, HelpCircle} from '@lucide/svelte'
</script>

{#snippet basicTemplate(args)}
    <div class="flex items-center justify-center min-h-96">
        <Popover bind:open={args.open}>
            <PopoverTrigger
                    class="inline-flex items-center justify-center rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 bg-primary text-primary-foreground hover:bg-primary/90 h-10 px-4 py-2">
                Open Popover
            </PopoverTrigger>
            <PopoverContent class="w-80">
                <div class="grid gap-4">
                    <div class="space-y-2">
                        <h4 class="font-medium leading-none">Dimensions</h4>
                        <p class="text-sm text-muted-foreground">
                            Set the dimensions for the layer.
                        </p>
                    </div>
                    <div class="grid gap-2">
                        <div class="grid grid-cols-3 items-center gap-4">
                            <label for="width">Width</label>
                            <input
                                    id="width"
                                    type="text"
                                    value="100%"
                                    class="col-span-2 h-8 px-3 py-1 text-sm border rounded-md"
                            />
                        </div>
                        <div class="grid grid-cols-3 items-center gap-4">
                            <label for="maxWidth">Max. width</label>
                            <input
                                    id="maxWidth"
                                    type="text"
                                    value="300px"
                                    class="col-span-2 h-8 px-3 py-1 text-sm border rounded-md"
                            />
                        </div>
                        <div class="grid grid-cols-3 items-center gap-4">
                            <label for="height">Height</label>
                            <input
                                    id="height"
                                    type="text"
                                    value="25px"
                                    class="col-span-2 h-8 px-3 py-1 text-sm border rounded-md"
                            />
                        </div>
                    </div>
                </div>
            </PopoverContent>
        </Popover>
    </div>
{/snippet}

<Story
        args={{
		open: false,
	}}
        name="Basic"
        template={basicTemplate}
/>

{#snippet showcaseTemplate(args)}
    <div class="flex items-center justify-center min-h-96">
        <Popover bind:open={args.open}>
            <PopoverTrigger
                    class="inline-flex items-center justify-center rounded-full text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 hover:bg-accent hover:text-accent-foreground h-10 w-10">
                <User class="h-4 w-4"/>
            </PopoverTrigger>
            <PopoverContent class="w-80" side="bottom" align="center">
                <div class="space-y-4">
                    <div class="space-y-2">
                        <h3 class="font-medium leading-none">Profile Settings</h3>
                        <p class="text-sm text-muted-foreground">
                            Manage your account settings and preferences.
                        </p>
                    </div>
                    <div class="space-y-3">
                        <div class="flex items-center space-x-3">
                            <div class="w-12 h-12 rounded-full bg-gradient-to-r from-blue-500 to-purple-600 flex items-center justify-center">
                                <span class="text-white font-semibold">JD</span>
                            </div>
                            <div class="flex-1">
                                <p class="font-medium">John Doe</p>
                                <p class="text-sm text-muted-foreground">john.doe@example.com</p>
                            </div>
                        </div>
                        <div class="border-t pt-3 space-y-2">
                            <button class="w-full inline-flex items-center justify-center rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 bg-secondary text-secondary-foreground hover:bg-secondary/80 h-9 px-3">
                                <Settings class="mr-2 h-4 w-4"/>
                                Settings
                            </button>
                            <button class="w-full inline-flex items-center justify-center rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 hover:bg-accent hover:text-accent-foreground h-9 px-3">
                                <HelpCircle class="mr-2 h-4 w-4"/>
                                Help & Support
                            </button>
                        </div>
                    </div>
                </div>
            </PopoverContent>
        </Popover>
    </div>
{/snippet}

<Story
        args={{
		open: false,
	}}
        name="Showcase"
        parameters={{
		docs: {
			description: {
				story: 'Profile settings popover inspired by modern UI patterns, featuring user avatar, account information, and quick action buttons.',
			},
		},
	}}
        template={showcaseTemplate}
/>

{#snippet interactiveTemplate(args)}
    <div class="flex items-center justify-center min-h-96 space-x-4">
        <Popover bind:open={args.open}>
            <PopoverTrigger
                    class="inline-flex items-center justify-center rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 bg-primary text-primary-foreground hover:bg-primary/90 h-10 px-4 py-2">
                Share Document
            </PopoverTrigger>
            <PopoverContent class="w-96">
                <div class="space-y-4">
                    <div class="space-y-2">
                        <h4 class="font-medium leading-none">Share with others</h4>
                        <p class="text-sm text-muted-foreground">
                            Enter email addresses to share this document.
                        </p>
                    </div>
                    <div class="space-y-3">
                        <div class="flex space-x-2">
                            <input
                                    type="email"
                                    placeholder="Enter email address"
                                    class="flex h-9 w-full rounded-md border border-input bg-transparent px-3 py-1 text-sm shadow-sm transition-colors file:border-0 file:bg-transparent file:text-sm file:font-medium placeholder:text-muted-foreground focus-visible:outline-none focus-visible:ring-1 focus-visible:ring-ring disabled:cursor-not-allowed disabled:opacity-50"
                            />
                            <button class="inline-flex items-center justify-center rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 bg-primary text-primary-foreground hover:bg-primary/90 h-9 px-3">
                                Add
                            </button>
                        </div>
                        <div class="space-y-2">
                            <div class="flex items-center justify-between p-2 border rounded-md">
                                <div class="flex items-center space-x-2">
                                    <div class="w-6 h-6 rounded-full bg-blue-100 flex items-center justify-center">
                                        <span class="text-xs font-medium text-blue-600">A</span>
                                    </div>
                                    <span class="text-sm">alice@example.com</span>
                                </div>
                                <select class="text-sm border rounded px-2 py-1">
                                    <option>Can edit</option>
                                    <option>Can view</option>
                                </select>
                            </div>
                        </div>
                        <div class="flex items-center space-x-2 pt-2">
                            <input type="checkbox" id="notify" class="rounded border-gray-300"/>
                            <label for="notify" class="text-sm">Notify people via email</label>
                        </div>
                    </div>
                </div>
            </PopoverContent>
        </Popover>
    </div>
{/snippet}

<Story
        args={{
		open: false,
	}}
        name="Interactive Form"
        parameters={{
		docs: {
			description: {
				story: 'Interactive popover with a form for sharing documents, demonstrating complex interactions within a popover.',
			},
		},
	}}
        template={interactiveTemplate}
/>

{#snippet placementTemplate(args)}
    <div class="grid grid-cols-3 gap-8 items-center justify-center min-h-96">
        <Popover>
            <PopoverTrigger
                    class="inline-flex items-center justify-center rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 bg-primary text-primary-foreground hover:bg-primary/90 h-10 px-4 py-2">
                Top
            </PopoverTrigger>
            <PopoverContent side="top">
                <p class="text-sm">Popover positioned at the top</p>
            </PopoverContent>
        </Popover>

        <Popover>
            <PopoverTrigger
                    class="inline-flex items-center justify-center rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 bg-primary text-primary-foreground hover:bg-primary/90 h-10 px-4 py-2">
                Right
            </PopoverTrigger>
            <PopoverContent side="right">
                <p class="text-sm">Popover positioned on the right</p>
            </PopoverContent>
        </Popover>

        <Popover>
            <PopoverTrigger
                    class="inline-flex items-center justify-center rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 bg-primary text-primary-foreground hover:bg-primary/90 h-10 px-4 py-2">
                Bottom
            </PopoverTrigger>
            <PopoverContent side="bottom">
                <p class="text-sm">Popover positioned at the bottom</p>
            </PopoverContent>
        </Popover>
    </div>
{/snippet}

<Story
        args={{
		open: false,
	}}
        name="Placement"
        parameters={{
		docs: {
			description: {
				story: 'Popover positioning examples showing different placement options (top, right, bottom).',
			},
		},
	}}
        template={placementTemplate}
/>

{#snippet arrowTemplate(args)}
    <div class="flex items-center justify-center min-h-96">
        <Popover>
            <PopoverTrigger
                    class="inline-flex items-center justify-center rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 bg-primary text-primary-foreground hover:bg-primary/90 h-10 px-4 py-2">
                Popover with Arrow
            </PopoverTrigger>
            <PopoverContent side="bottom" align="center">
                <PopoverArrow class="text-border"/>
                <div class="space-y-2">
                    <h4 class="font-medium leading-none">With Arrow</h4>
                    <p class="text-sm text-muted-foreground">
                        This popover has an arrow pointing to the trigger element.
                    </p>
                </div>
            </PopoverContent>
        </Popover>
    </div>
{/snippet}

<Story
        args={{
		open: false,
	}}
        name="With Arrow"
        parameters={{
		docs: {
			description: {
				story: 'Popover with an arrow component that points to the trigger element.',
			},
		},
	}}
        template={arrowTemplate}
/>

{#snippet offsetTemplate(args)}
    <div class="flex items-center justify-center min-h-96 space-x-8">
        <div class="space-y-4">
            <Popover>
                <PopoverTrigger
                        class="inline-flex items-center justify-center rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 bg-primary text-primary-foreground hover:bg-primary/90 h-10 px-4 py-2">
                    Default Position
                </PopoverTrigger>
                <PopoverContent side="bottom" align="center">
                    <div class="space-y-2">
                        <h4 class="font-medium leading-none">Default Offset</h4>
                        <p class="text-sm text-muted-foreground">
                            This popover uses the default offset distance.
                        </p>
                    </div>
                </PopoverContent>
            </Popover>
        </div>

        <div class="space-y-4">
            <Popover>
                <PopoverTrigger
                        class="inline-flex items-center justify-center rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 bg-primary text-primary-foreground hover:bg-primary/90 h-10 px-4 py-2">
                    Offset: 10
                </PopoverTrigger>
                <PopoverContent side="bottom" align="center" sideOffset={10}>
                    <div class="space-y-2">
                        <h4 class="font-medium leading-none">Offset: 10</h4>
                        <p class="text-sm text-muted-foreground">
                            This popover has a 10px offset from the trigger.
                        </p>
                    </div>
                </PopoverContent>
            </Popover>
        </div>

        <div class="space-y-4">
            <Popover>
                <PopoverTrigger
                        class="inline-flex items-center justify-center rounded-md text-sm font-medium ring-offset-background transition-colors focus-visible:outline-none focus-visible:ring-2 focus-visible:ring-ring focus-visible:ring-offset-2 disabled:pointer-events-none disabled:opacity-50 bg-primary text-primary-foreground hover:bg-primary/90 h-10 px-4 py-2">
                    Offset: 20
                </PopoverTrigger>
                <PopoverContent side="bottom" align="center" sideOffset={20}>
                    <div class="space-y-2">
                        <h4 class="font-medium leading-none">Offset: 20</h4>
                        <p class="text-sm text-muted-foreground">
                            This popover has a 20px offset from the trigger.
                        </p>
                    </div>
                </PopoverContent>
            </Popover>
        </div>
    </div>
{/snippet}

<Story
        args={{
		open: false,
	}}
        name="Offset"
        parameters={{
		docs: {
			description: {
				story: 'Popover with different offset values to control the distance between the popover and its trigger element.',
			},
		},
	}}
        template={offsetTemplate}
/>