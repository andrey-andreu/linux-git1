cat $1 | awk -F, 'BEGIN{rate=0; i=0} {if ($18>=0){rate+=$18;i+=1}} END{print "RATING_AVG", rate/i}'
cat $1 | awk -F, '{print $1}' | cut -d "_" -f1 | sort | uniq -c | awk "-F " {'print "HOTELNUMBER " $2, $1'}
cat $1 | awk -F, '{if ($12>=0) print $1}' | cut -d "_" -f1 > /tmp/h1
cat $1 | awk -F, '{if ($12>=0) print $1}' | cut -d "_" -f3 > /tmp/h2
cat $1 | awk -F, '{if ($12>=0) print $1}' | cut -d "_" -f4 > /tmp/h3
cat $1 | awk -F, '{if ($12>=0) print $12}' > /tmp/clen

cat $1 | awk -F, '/hilton/ {tolower($2); if($12 > 0){c1[tolower($7)]+= $12; i1[tolower($7)]+= 1}} /holiday inn/ {tolower($2); if($12>0){c2[tolower($7)]+= $12; i2[tolower($7)]+= 1}} END { for(i in c1) { print "CLEANLINESS", i, c2[i]/i2[i], c1[i]/i1[i]}}'

cat $1 | awk -F, '{if ($12>=0 && $18>=0) print $12}' > /tmp/cl
cat $1 | awk -F, '{if ($12>=0 && $18>=0) print $18}' > /tmp/o

paste -d, /tmp/o /tmp/cl > /tmp/fit

gnuplot -e "set terminal png size 300, 400;
	    set output 'fit.png';
	    set datafile separator comma;
	    f(x) = m * x + b;
	    fit f(x) '/tmp/fit' via m, b;
	    plot '/tmp/fit' title 'x vs y' with points, f(x) title 'fit';
            exit();"
