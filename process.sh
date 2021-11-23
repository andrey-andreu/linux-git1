cat $1 | awk -F, 'BEGIN{rate=0; i=0} {rate+=$1;i+=1} END{print "RATING_AVG ", rate/i}'
cat $1 | awk -F, '{print $1}' | cut -d "_" -f1 | sort | uniq -c | awk "-F " {'print "HOTELNUMBER " $2, $1'}
cat $1 | awk -F, '{if ($12>0) print $1}' | cut -d "_" -f1 > /tmp/h1
cat $1 | awk -F, '{if ($12>0) print $1}' | cut -d "_" -f3 > /tmp/h2
cat $1 | awk -F, '{if ($12>0) print $1}' | cut -d "_" -f4 > /tmp/h3
cat $1 | awk -F, '{if ($12>0) print $12}' > /tmp/clen
paste -d, /tmp/h1 /tmp/h2 > /tmp/h
paste -d, /tmp/h /tmp/h3 > /tmp/hotel
paste -d, /tmp/clen /tmp/hotel > /tmp/hotels
cat /tmp/hotels | awk -F, 'BEGIN{hil=0; i1=0; hol=0; i2=0} {if ($2=="are" && $3=="holiday" && $4=="inn") hol+=$1} {if ($2=="are" && $3=="holiday" && $4=="inn") i2+=1}  {if ($2=="are" && $3=="hilton") hil+=$1} {if ($2=="are" && $3=="hilton") i1+=1} END{print "CLEANLINESS", "are", hil/i1, hol/i2}'
cat /tmp/hotels | awk -F, 'BEGIN{hil=0; i1=0; hol=0; i2=0} {if ($2=="can" && $3=="holiday" && $4=="inn") hol+=$1} {if ($2=="can" && $3=="holiday" && $4=="inn") i2+=1}  {if ($2=="can" && $3=="hilton") hil+=$1} {if ($2=="can" && $3=="hilton") i1+=1} END{print "CLEANLINESS", "can", hil/i1, hol/i2}'
cat /tmp/hotels | awk -F, 'BEGIN{hil=0; i1=0; hol=0; i2=0} {if ($2=="china" && $3=="holiday" && $4=="inn") hol+=$1} {if ($2=="china" && $3=="holiday" && $4=="inn") i2+=1}  {if ($2=="china" && $3=="hilton") hil+=$1} {if ($2=="china" && $3=="hilton") i1+=1} END{print "CLEANLINESS", "china", hil/i1, hol/i2}'
cat /tmp/hotels | awk -F, 'BEGIN{hil=0; i1=0; hol=0; i2=0} {if ($2=="india" && $3=="holiday" && $4=="inn") hol+=$1} {if ($2=="india" && $3=="holiday" && $4=="inn") i2+=1}  {if ($2=="india" && $3=="hilton") hil+=$1} {if ($2=="india" && $3=="hilton") i1+=1} END{print "CLEANLINESS", "india", hil/i1, hol/i2}'
cat /tmp/hotels | awk -F, 'BEGIN{hil=0; i1=0; hol=0; i2=0} {if ($2=="uk" && $3=="holiday" && $4=="inn") hol+=$1} {if ($2=="uk" && $3=="holiday" && $4=="inn") i2+=1}  {if ($2=="uk" && $3=="hilton") hil+=$1} {if ($2=="uk" && $3=="hilton") i1+=1} END{print "CLEANLINESS", "uk", hil/i1, hol/i2}'
cat /tmp/hotels | awk -F, 'BEGIN{hil=0; i1=0; hol=0; i2=0} {if ($2=="usa" && $3=="holiday" && $4=="inn") hol+=$1} {if ($2=="usa" && $3=="holiday" && $4=="inn") i2+=1}  {if ($2=="usa" && $3=="hilton") hil+=$1} {if ($2=="usa" && $3=="hilton") i1+=1} END{print "CLEANLINESS", "usa", hil/i1, hol/i2}'

cat $1 | awk -F, '{print $12}' > /tmp/cl
cat $1 | awk -F, '{print $12}' > /tmp/o

paste -d, /tmp/cl /tmp/o > /tmp/fit
#!/usr/local/bin/gnuplot

gnuplot
f(x)=m*x+b
fit f(x) '/tmp/fit' via m,b
set output 'w_vs_h_fit.png'

