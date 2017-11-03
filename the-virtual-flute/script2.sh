

#mkdir fingerings
cd fingerings

LIMIT=651588039

for ((a=0; a <= LIMIT ; a++))  # Double parentheses, and naked "LIMIT"
do
  echo -n "$a "
  wget "http://flute.fingerings.info/graph.php?fingering=$a&foot=B&splitE=1"
  cat "graph.php?fingering=$a&foot=B&splitE=1" | grep Holes | sed 's/<li>Holes: //' | sed 's/X/1/g'  | sed 's/O/0/g'  >> fingeringsHoles.txt
  cat "graph.php?fingering=$a&foot=B&splitE=1" | grep '<font size=+2><font color=#006699>' | sed 's/<font size=+2><font color=#006699>//' | sed 's/<\/font> Impedance Spectrum<\/font>//' >> fingeringString.txt
done
