for NUM in $(python3 -c "print(' '.join('%02d'%n for n in range(1,20)))")
do
    echo "$NUM"
    curl http://web.stanford.edu/class/cs354/scribe/lecture$NUM.pdf -o lec-$NUM.pdf
done

