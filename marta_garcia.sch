#!/bin/awk -f
#AUTHOR: Marta Garcia Mondejar
#This script is an university project

BEGIN {print "Introduce the DNA sequence to search for:"

#INTRODUCE THE SEQUENCE TO SEARCH

getline seq <"/dev/stdin"

#VARIABLES

count=0
suma=0

#CHANGE TO CAPS THE SEQUENCE

SEQ=toupper(seq)

#CREATE THE HEADER

OFS="\t"
print "SEQ", "LENGTH", "RESTRICTION_SITE"

#THE LINES THAT START WITH THE SYMBOL '>' ARE NOW COLUMNS

FS="\n"
RS=">"} 

#MATCH: create the variable restriction site

restrictionsite=0

#CONDITION: SEARCH FOR THE INTRODUCED SEQUENCE AND ADD +1

{if(restrictionsite=match($0,seq)) count++}
{print ""$1"\t"length($2)"\t"restrictionsite""}

#SUMA VARIABLE: LENGTH DIVIDED FOR NUMBER OF SEQUENCES

{suma=length($2)/(NR-1)}

END{
#PRINT: All sequences without the header
print "Nº total de secuencias: " NR-1
print "Tamaño medio de las secuencias de DNA: "  suma
print "Nº de secuencias con "SEQ" motivo: " count
print "Fin!!"
}



