

mkdir fingerings
cd fingerings

LIMIT=10

for ((a=1; a <= LIMIT ; a++))  # Double parentheses, and naked "LIMIT"
do
  echo -n "$a "
  wget "http://flute.fingerings.info/graph.php?fingering=$a&foot=B&splitE=1"
  cat "graph.php?fingering=$a&foot=B&splitE=1" | grep Holes | sed 's/<li>Holes: //' > $a.txt
  rm "graph.php?fingering=$a&foot=B&splitE=1" 
done
