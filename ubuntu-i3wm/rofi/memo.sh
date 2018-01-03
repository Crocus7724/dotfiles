#!/usr/bin/env bash
memo_dir=${TYPORA_MEMO_DIR:-"$HOME/Documents/typora"}
list=$(find $memo_dir -type f -name "*.md")
[ -z "$@" ] && echo "New" 
[ "$@" = "New" ] && command="typora >/dev/null 2>&1 &"
for f in $list; do
  [ -z "$@" ] && echo "$f" && continue
  [ "$@" = "$f" ] && command="typora $f >/dev/null 2>&1 &" && break
done

eval "${command:-:}"
