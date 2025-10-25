/**
 * Gets the local timezone from the browser's Intl API
 * @returns The local timezone string (e.g., "America/New_York")
 */
// @ts-ignore
export const getLocalTimeZone = () => {
	return typeof Intl !== 'undefined' ? Intl.DateTimeFormat().resolvedOptions().timeZone : 'UTC'
}
