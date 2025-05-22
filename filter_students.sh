#!/bin/bash

csv_file=test.csv

awk -F',' 'NR==1 { next }
{
	name=$1
	grade=$2 + 0 #Βεβαιωνόμαστε ότι είναι αριθμός

	if (NR == 2) {
		max = min = grade
		top_student = name
	
	}

	if (grade > max) {
		max = grade
		top_student = name
	
	}
	if (grade < min) min = grade
	total += grade
	count++

}
END {
	print "Μαθητής με υψηλότερη βαθμολογία:", top_student
	print "Αριθμός μαθητών:", count
	print "Μέση βαθμολογία:", total/count
	print "Υψηλότερη βαθμολογία:", max
	print "Χαμηλότερη βαθμολογία:", min

}' "$csv_file"
