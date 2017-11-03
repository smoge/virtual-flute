

mkdir fingerings
cd fingerings

LIMIT=651588039

for ((a=1; a <= LIMIT ; a++))  # Double parentheses, and naked "LIMIT"
do
  echo -n "$a "
  wget "http://flute.fingerings.info/graph.php?fingering=$a&foot=B&splitE=1"
  cat "graph.php?fingering=$a&foot=B&splitE=1" | grep Holes | sed 's/<li>Holes: //' | sed 's/X/1/g'  | sed 's/O/0/g' |  COMMAND "$(cat -) $a" >> fingerings2.txt
  rm "graph.php?fingering=$a&foot=B&splitE=1"
done
