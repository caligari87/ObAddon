#!/bin/sh
find .. -iname \*.lua -exec sed -i -E -e 's/\r//' -e 's/\s+$//' -e 's/	/    /g' \{\} \;
find .. -iname \*.lua | while read f; do
	tail -c1 "$f" | read -r _ || echo >> "$f"
done
