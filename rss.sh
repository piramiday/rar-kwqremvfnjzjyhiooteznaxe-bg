#!/bin/bash
set -e
D="${GITHUB_REPOSITORY##*/}"
D="${D//-*-/}"
curl -s -o A "https://$D.to/rss.php"
curl -s -o B "https://$D.to/rssdd.php"
grep -oP "\s+<ti.*" A > _0
grep -oP "\s+<gu.*" A > _1
grep -oP "\s+<li.*" B > _2
grep -oP "\s+<pu.*" A > _3
head -n10 A
while IFS=$'\t' read T G L P; do
   echo "<item>"
   echo $T
   echo $G
   echo $L
   echo $P
   echo "</item>"
done < <( paste _? )
tail -n2 A
