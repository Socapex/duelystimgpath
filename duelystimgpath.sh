#! /bin/bash

# MIT License
#
# Copyright (c) 2016 Philippe Groarke
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

shopt -s nullglob

usage="`basename $0` [inputfile] [output file] -- program to add data dump image path to Duelyst json file.
	Example: ./duelystimgpath.sh cards.json cards_clean.json
"

if [ ! -f "$1" ]; then
	echo "$usage";
	exit 0;
fi

outfile="$2";
if [ -z "$outfile" ]; then
	outfile="out.json";
fi

jq 'map(. + {imgpath: .faction | match("^[a-zA-Z]+"; "g")["string"] }) | map(. | .imgpath += "\/" + (.name | gsub("[^a-zA-Z]"; ""; "g")) + ".png" )' "$1" > "$outfile"

#nope
#jq ".[].faction" cards.json | awk '{print $1}' | tr -cd "[[:alnum:]]\n" > factions.temp;
#jq ".[].name" cards.json | tr -cd "[[:alnum:]]\n" | awk '{print $1 ".png"}' > names.temp;
#paste  -d "\/" factions.temp names.temp > paths.temp;
#
## Backup original file.
#cp "$1" ".$1.bak";
#
#i=0;
#while read -r path; do
#	echo "$path";
#	jq --arg imgpath "$path" ".[$i] + {imgpath: \$imgpath}" "$1" > "test.json";
#	((++i))
#done < paths.temp;
#
#rm factions.temp;
#rm names.temp;
#rm paths.temp;
