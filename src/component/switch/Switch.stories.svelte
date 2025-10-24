<script module>
	import { defineMeta } from '@storybook/addon-svelte-csf'
	import { Switch, SwitchRoot, SwitchThumb } from './index'

	const { Story } = defineMeta({
		title: 'Components/Switch',
		component: Switch,
		subcomponents: {
			SwitchRoot,
			SwitchThumb,
		},
		tags: ['autodocs'],
		parameters: {
			docs: {
				controls: {
					include: ['class', 'thumbClass', 'checked', 'disabled', 'required', 'name'],
				},
			},
		},
	})
</script>

<script>
	import { cn } from '$/lib/utils.js'
</script>

{#snippet basicTemplate(args)}
	<div class="flex items-center space-x-2">
		<Switch
			class={args.class}
			thumbClass={args.thumbClass}
			bind:checked={args.checked}
			disabled={args.disabled}
			required={args.required}
			name={args.name}
		/>
		<label
			for="switch"
			class="text-sm leading-none font-medium peer-disabled:cursor-not-allowed peer-disabled:opacity-70"
		>
			Do not disturb
		</label>
	</div>
{/snippet}

<Story
	args={{
		checked: false,
	}}
	name="Basic"
	template={basicTemplate}
/>

{#snippet checkedTemplate(args)}
	<div class="flex items-center space-x-2">
		<Switch class={args.class} thumbClass={args.thumbClass} bind:checked={args.checked} />
		<label for="switch" class="text-sm leading-none font-medium"> Notifications enabled </label>
	</div>
{/snippet}

<Story
	args={{
		checked: true,
	}}
	name="Checked"
	template={checkedTemplate}
/>

{#snippet disabledTemplate(args)}
	<div class="space-y-4">
		<div class="flex items-center space-x-2">
			<Switch class={args.class} thumbClass={args.thumbClass} checked={false} disabled={true} />
			<label for="switch" class="text-sm leading-none font-medium"> Disabled (unchecked) </label>
		</div>
		<div class="flex items-center space-x-2">
			<Switch class={args.class} thumbClass={args.thumbClass} checked={true} disabled={true} />
			<label for="switch" class="text-sm leading-none font-medium"> Disabled (checked) </label>
		</div>
	</div>
{/snippet}

<Story
	args={{
		checked: false,
	}}
	name="Disabled"
	template={disabledTemplate}
/>

{#snippet formTemplate(args)}
	<form class="space-y-4" on:submit|preventDefault={() => alert('Form submitted!')}>
		<div class="space-y-2">
			<h3 class="text-lg font-medium">Notification Settings</h3>
			<div class="flex items-center space-x-2">
				<Switch
					class={args.class}
					thumbClass={args.thumbClass}
					bind:checked={args.checked}
					name="notifications"
					value="enabled"
				/>
				<label for="notifications" class="text-sm leading-none font-medium"> Email notifications </label>
			</div>
			<div class="flex items-center space-x-2">
				<Switch
					class={args.class}
					thumbClass={args.thumbClass}
					bind:checked={args.pushNotifications}
					name="push_notifications"
					value="enabled"
				/>
				<label for="push_notifications" class="text-sm leading-none font-medium"> Push notifications </label>
			</div>
			<div class="flex items-center space-x-2">
				<Switch
					class={args.class}
					thumbClass={args.thumbClass}
					bind:checked={args.smsNotifications}
					name="sms_notifications"
					value="enabled"
					required={true}
				/>
				<label for="sms_notifications" class="text-sm leading-none font-medium">
					SMS notifications (required)
				</label>
			</div>
		</div>
		<button type="submit" class="bg-primary text-primary-foreground rounded-md px-4 py-2"> Save Settings </button>
	</form>
{/snippet}

<Story
	args={{
		checked: true,
		pushNotifications: false,
		smsNotifications: true,
	}}
	name="Form Integration"
	template={formTemplate}
/>

{#snippet customStyleTemplate(args)}
	<div class="space-y-6">
		<div class="flex items-center space-x-3">
			<Switch
				id="custom-switch-1"
				class="h-8 w-16 data-[state=checked]:bg-green-500 data-[state=unchecked]:bg-gray-300"
				thumbClass="h-6 w-6 data-[state=checked]:translate-x-8"
				bind:checked={args.checked}
			/>
			<label for="custom-switch-1" class="text-sm font-medium">
				{args.checked ? 'Active' : 'Inactive'}
			</label>
		</div>

		<div class="flex items-center space-x-3">
			<Switch
				id="custom-switch-2"
				class="h-4 w-8 data-[state=checked]:bg-blue-500 data-[state=unchecked]:bg-gray-200"
				thumbClass="h-3 w-3 data-[state=checked]:translate-x-4"
				bind:checked={args.smallSwitch}
			/>
			<label for="custom-switch-2" class="text-sm font-medium">Small switch</label>
		</div>

		<div class="flex items-center space-x-3">
			<Switch
				id="custom-switch-3"
				class="h-12 w-24 rounded-full data-[state=checked]:bg-purple-500 data-[state=unchecked]:bg-gray-300"
				thumbClass="h-10 w-10 rounded-full data-[state=checked]:translate-x-12 border-2 border-white shadow-lg"
				bind:checked={args.largeSwitch}
			/>
			<label for="custom-switch-3" class="text-sm font-medium">Large switch</label>
		</div>
	</div>
{/snippet}

<Story
	args={{
		checked: true,
		smallSwitch: false,
		largeSwitch: true,
	}}
	name="Custom Styles"
	template={customStyleTemplate}
/>

{#snippet controlledTemplate(args)}
	<div class="space-y-4">
		<div class="flex items-center space-x-3">
			<Switch
				id="controlled-switch"
				class={args.class}
				thumbClass={args.thumbClass}
				bind:checked={args.checked}
			/>
			<label for="controlled-switch" class="text-sm font-medium">Controlled switch</label>
		</div>

		<div class="flex items-center space-x-2">
			<span class="text-muted-foreground text-sm">Current value:</span>
			<code class="bg-muted rounded px-2 py-1 text-sm">{args.checked ? 'true' : 'false'}</code>
		</div>

		<div class="flex space-x-2">
			<button
				type="button"
				class="bg-primary text-primary-foreground rounded px-3 py-1 text-sm"
				on:click={() => (args.checked = true)}
			>
				Set to ON
			</button>
			<button
				type="button"
				class="bg-secondary text-secondary-foreground rounded px-3 py-1 text-sm"
				on:click={() => (args.checked = false)}
			>
				Set to OFF
			</button>
			<button
				type="button"
				class="bg-muted text-muted-foreground rounded px-3 py-1 text-sm"
				on:click={() => (args.checked = !args.checked)}
			>
				Toggle
			</button>
		</div>
	</div>
{/snippet}

<Story
	args={{
		checked: false,
	}}
	name="Controlled"
	template={controlledTemplate}
/>
