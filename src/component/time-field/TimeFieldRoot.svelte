<script lang="ts">
	import { TimeField, type TimeValue } from 'bits-ui'
	import { cn } from '$/lib/utils'
	import type { TimeFieldRootProps } from 'bits-ui'

	export type Props = TimeFieldRootProps & {
		value?: TimeValue
		placeholder?: TimeValue
	}

	let { value = $bindable(), placeholder = $bindable(), ...props }: Props = $props()
</script>

<div>
	<TimeField.Root {...props} bind:value bind:placeholder />
</div>
