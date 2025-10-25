<script lang="ts">
	import { TimeRangeField, type TimeValue } from 'bits-ui'
	import { cn } from '$/lib/utils'
	import type { TimeRangeFieldRootProps } from 'bits-ui'

	export type Props = TimeRangeFieldRootProps & {
		value?: { start?: TimeValue; end?: TimeValue }
		placeholder?: TimeValue
	}

	let { value = $bindable(), placeholder = $bindable(), ...props }: Props = $props()
</script>

<div>
	<TimeRangeField.Root {...props} bind:value bind:placeholder />
</div>
