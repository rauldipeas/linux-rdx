#!/bin/bash
set -e
auto_push() {
	added=()
	deleted=()
	modified=()
	while read -r status file; do
		base="$(basename "$file")"
		name="${base%.*}"
		case "$status" in
		A*) added+=("+$name") ;;
		D*) deleted+=("-$name") ;;
		M*) modified+=("^$name") ;;
		esac
	done < <(git status --porcelain)
	msg=""
	[[ ${#added[@]} -gt 0 ]] && msg+=$'\n'$(printf "%s\n" "${added[@]}")
	[[ ${#deleted[@]} -gt 0 ]] && msg+=$'\n'$(printf "%s\n" "${deleted[@]}")
	[[ ${#modified[@]} -gt 0 ]] && msg+=$'\n'$(printf "%s\n" "${modified[@]}")
	git add .
	[[ -z "$msg" ]] && exit 0
	git commit -m "$msg"
	git push -fu origin main
}
auto_push
printf "✅ Commit concluído!"