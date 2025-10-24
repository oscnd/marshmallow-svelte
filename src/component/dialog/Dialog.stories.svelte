<script module>
    import {defineMeta} from '@storybook/addon-svelte-csf'
    import {
        Dialog as DialogRoot,
        DialogContent,
        DialogHeader,
        DialogTitle,
        DialogDescription,
        DialogFooter
    } from './index'
    import {Dialog} from 'bits-ui'
    import {Button} from '../button/index'

    const {Story} = defineMeta({
        title: 'Components/Dialog',
        component: DialogRoot,
        subcomponents: {
            DialogContent,
            DialogHeader,
            DialogTitle,
            DialogDescription,
            DialogFooter,
        },
        tags: ['autodocs'],
        parameters: {
            layout: 'centered',
            docs: {
                controls: {
                    include: ['open', 'onOpenChange'],
                },
            },
        },
    })
</script>

{#snippet basicDialogTemplate(args)}
    <DialogRoot bind:open={args.open} onOpenChange={args.onOpenChange}>
        <Dialog.Trigger asChild>
            {#snippet children(builder)}
                <Button {...builder}>Open Dialog</Button>
            {/snippet}
        </Dialog.Trigger>
        <DialogContent>
            <DialogHeader>
                <DialogTitle>Are you sure?</DialogTitle>
                <DialogDescription>
                    This action cannot be undone. This will permanently delete your account and remove your data from
                    our servers.
                </DialogDescription>
            </DialogHeader>
            <DialogFooter>
                <Dialog.Close asChild>
                    {#snippet children(builder)}
                        <Button {...builder} variant="outline">Cancel</Button>
                    {/snippet}
                </Dialog.Close>
                <Dialog.Close asChild>
                    {#snippet children(builder)}
                        <Button {...builder} variant="primary">Continue</Button>
                    {/snippet}
                </Dialog.Close>
            </DialogFooter>
        </DialogContent>
    </DialogRoot>
    <p class="text-muted-foreground mt-4 text-sm">Dialog is {args.open ? 'open' : 'closed'}</p>
{/snippet}

<Story name="Basic" template={basicDialogTemplate}/>

{#snippet formDialogTemplate(args)}
    <DialogRoot bind:open={args.open} onOpenChange={args.onOpenChange}>
        <Dialog.Trigger asChild>
            {#snippet children(builder)}
                <Button {...builder}>Edit Profile</Button>
            {/snippet}
        </Dialog.Trigger>
        <DialogContent>
            <DialogHeader>
                <DialogTitle>Edit Profile</DialogTitle>
                <DialogDescription>Make changes to your profile here. Click save when you're done.</DialogDescription>
            </DialogHeader>
            <div class="grid gap-4 py-4">
                <div class="grid grid-cols-4 items-center gap-4">
                    <label for="name" class="text-right">Name</label>
                    <input
                            id="name"
                            value="Pedro Duarte"
                            class="border-input bg-background ring-offset-background placeholder:text-muted-foreground focus-visible:ring-ring col-span-3 h-10 w-full rounded-md border px-3 py-2 text-sm file:border-0 file:bg-transparent file:text-sm file:font-medium focus-visible:ring-2 focus-visible:ring-offset-2 focus-visible:outline-none disabled:cursor-not-allowed disabled:opacity-50"
                    />
                </div>
                <div class="grid grid-cols-4 items-center gap-4">
                    <label for="username" class="text-right">Username</label>
                    <input
                            id="username"
                            value="@peduarte"
                            class="border-input bg-background ring-offset-background placeholder:text-muted-foreground focus-visible:ring-ring col-span-3 h-10 w-full rounded-md border px-3 py-2 text-sm file:border-0 file:bg-transparent file:text-sm file:font-medium focus-visible:ring-2 focus-visible:ring-offset-2 focus-visible:outline-none disabled:cursor-not-allowed disabled:opacity-50"
                    />
                </div>
            </div>
            <DialogFooter>
                <Dialog.Close asChild>
                    {#snippet children(builder)}
                        <Button {...builder} type="submit">Save changes</Button>
                    {/snippet}
                </Dialog.Close>
            </DialogFooter>
        </DialogContent>
    </DialogRoot>
    <p class="text-muted-foreground mt-4 text-sm">Dialog is {args.open ? 'open' : 'closed'}</p>
{/snippet}

<Story name="Form" template={formDialogTemplate}/>

{#snippet scrollableDialogTemplate(args)}
    <DialogRoot bind:open={args.open} onOpenChange={args.onOpenChange}>
        <Dialog.Trigger asChild>
            {#snippet children(builder)}
                <Button {...builder}>View Terms</Button>
            {/snippet}
        </Dialog.Trigger>
        <DialogContent class="max-w-2xl">
            <DialogHeader>
                <DialogTitle>Terms of Service</DialogTitle>
                <DialogDescription>Please read and accept our terms of service.</DialogDescription>
            </DialogHeader>
            <div class="max-h-96 overflow-y-auto">
                <div class="space-y-4 text-sm">
                    <h3 class="font-semibold">1. Acceptance of Terms</h3>
                    <p>
                        By accessing and using this service, you accept and agree to be bound by the terms and provision
                        of this agreement.
                    </p>

                    <h3 class="font-semibold">2. Use License</h3>
                    <p>
                        Permission is granted to temporarily download one copy of the materials on our website for
                        personal, non-commercial transitory viewing only.
                    </p>

                    <h3 class="font-semibold">3. Disclaimer</h3>
                    <p>
                        The materials on our website are provided on an 'as is' basis. We make no warranties, expressed
                        or implied, and hereby disclaim and negate all other warranties including without limitation,
                        implied warranties or conditions of merchantability, fitness for a particular purpose, or
                        non-infringement of intellectual property or other violation of rights.
                    </p>

                    <h3 class="font-semibold">4. Limitations</h3>
                    <p>
                        In no event shall our company or its suppliers be liable for any damages (including, without
                        limitation, damages for loss of data or profit, or due to business interruption) arising out of
                        the use or inability to use the materials on our website.
                    </p>

                    <h3 class="font-semibold">5. Privacy Policy</h3>
                    <p>
                        Your Privacy Policy will govern the use of your information in connection with this website and
                        service.
                    </p>

                    <h3 class="font-semibold">6. Revisions and Errata</h3>
                    <p>
                        The materials appearing on our website could include technical, typographical, or photographic
                        errors. We do not warrant that any of the materials on its website are accurate, complete, or
                        current.
                    </p>

                    <h3 class="font-semibold">7. Governing Law</h3>
                    <p>
                        These terms and conditions are governed by and construed in accordance with the laws of the
                        jurisdiction in which our company operates and you irrevocably submit to the exclusive
                        jurisdiction of the courts in that state or location.
                    </p>
                </div>
            </div>
            <DialogFooter>
                <Dialog.Close asChild>
                    {#snippet children(builder)}
                        <Button {...builder} variant="outline">Decline</Button>
                    {/snippet}
                </Dialog.Close>
                <Dialog.Close asChild>
                    {#snippet children(builder)}
                        <Button {...builder} variant="primary">Accept</Button>
                    {/snippet}
                </Dialog.Close>
            </DialogFooter>
        </DialogContent>
    </DialogRoot>
    <p class="text-muted-foreground mt-4 text-sm">Dialog is {args.open ? 'open' : 'closed'}</p>
{/snippet}

<Story name="Scrollable Content" template={scrollableDialogTemplate}/>

{#snippet customStyledDialogTemplate(args)}
    <DialogRoot bind:open={args.open} onOpenChange={args.onOpenChange}>
        <Dialog.Trigger asChild>
            {#snippet children(builder)}
                <Button {...builder}
                        class="bg-gradient-to-r from-purple-500 to-pink-500 hover:from-purple-600 hover:to-pink-600"
                >Custom Dialog
                </Button
                >
            {/snippet}
        </Dialog.Trigger>
        <DialogContent
                class="border-2 border-purple-200 bg-gradient-to-br from-purple-50 to-pink-50 dark:from-purple-950 dark:to-pink-950"
        >
            <DialogHeader>
                <DialogTitle class="bg-gradient-to-r from-purple-600 to-pink-600 bg-clip-text text-transparent"
                >Custom Styled Dialog
                </DialogTitle
                >
                <DialogDescription>
                    This dialog demonstrates custom styling with gradients and colors.
                </DialogDescription>
            </DialogHeader>
            <div class="py-4">
                <p class="text-center text-lg font-medium">✨ Beautiful custom styling ✨</p>
            </div>
            <DialogFooter>
                <Dialog.Close asChild>
                    {#snippet children(builder)}
                        <Button {...builder}
                                variant="outline"
                                class="border-purple-200 hover:bg-purple-100 dark:border-purple-800 dark:hover:bg-purple-900"
                        >Cancel
                        </Button
                        >
                    {/snippet}
                </Dialog.Close>
                <Dialog.Close asChild>
                    {#snippet children(builder)}
                        <Button {...builder}
                                class="bg-gradient-to-r from-purple-500 to-pink-500 hover:from-purple-600 hover:to-pink-600"
                        >Awesome!
                        </Button
                        >
                    {/snippet}
                </Dialog.Close>
            </DialogFooter>
        </DialogContent>
    </DialogRoot>
    <p class="text-muted-foreground mt-4 text-sm">Dialog is {args.open ? 'open' : 'closed'}</p>
{/snippet}

<Story name="Custom Styled" template={customStyledDialogTemplate}/>
