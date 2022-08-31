#!/usr/bin/env bash
set -eo pipefail

reset-manual() {
	local title="$1"
	local root_key="$2"
	local -n __keys_array="$3"
	
	printf '%s\n' "$title"
	local key=
	for key in "${__keys_array[@]}"; do
		# printf '  -> %s\n' "$key"
		gsettings set "$root_key" "$key" "[]"
	done; unset -v key
}

reset-all() {
	local schema_root="$1"
	local skip_fn="$2"

	__skip_fn() {
		:
	}
	if [ -z "$skip_fn" ]; then
		skip_fn='__skip_fn'
	fi
	
	printf '%s\n' "$schema_root"
	local key=
	while read -r key; do
		if ! "$skip_fn" "$key"; then
			continue
		fi

		gsettings set "$schema_root" "$key" "[]"
	done < <(gsettings list-keys "$schema_root"); unset -v key

	unset -f __skip_fn
}


# shellcheck disable=SC2034
main() {
	skip() {
		case $key in
		volume-step)
			return 1
			;;
		esac
	}
	reset-all 'org.gnome.settings-daemon.plugins.media-keys' 'skip'


	skip() {
		case $key in 
		active-hint|column-size|fullscreen-launcher|gap-inner|gap-outer|log-level|\
		mouse-cursor-follows-active-window|row-size|show-skip-taskbar|show-title|\
		smart-gaps|snap-to-grid|tile-by-default)
			return 1
			;;
		esac
	}
	reset-all 'org.gnome.shell.extensions.pop-shell' 'skip'


	reset-all 'org.gnome.desktop.wm.keybindings'
	reset-all 'org.gnome.shell.keybindings'
	reset-all 'org.gnome.mutter.keybindings'

	# Accessibility
	local -a keys=(
		'decrease-text-size'
		'toggle-contrast'
		'increase-text-size'
		'on-screen-keyboard'
		'screenreader'
		'magnifier'
		'magnifier-zoom-in'
		'magnifier-zoom-out'
	)
	reset-manual 'Accessibility' 'org.gnome.settings-daemon.plugins.media-keys' 'keys'


	# Launchers
	local -a keys=(
		'home'
		'calculator'
		'email'
		'help'
		'terminal'
		'www'
		'search'
		'control-center'
	)
	reset-manual 'Launchers' 'org.gnome.settings-daemon.plugins.media-keys' 'keys'
	
	
}

main "$@"
