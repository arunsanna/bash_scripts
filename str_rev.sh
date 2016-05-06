#!/bin/bash

#reverse a number
#echo $PASS | rev
#echo $NAME | rev

#reading the parameters
#reading the name argument passed first
echo Script Name: "$0"

#read total argumants passes
echo Total Number of Argument Passed: "$#"

#list og args
#rev will echo the string in reverserver or you ca use <<
echo Arguments List -

echo $1 | rev

echo 2. $2 | rev

echo 3. $3 | rev

#rev<< $1
#rev<< $2
#rev<< $3
#for all arguments
echo All Arguments are: "$*"


#output
#Script Name: str_rev.sh
#Total Number of Argument Passed: 3
#Arguments List -
#1. 10
#2. arun
#3. admin
#All Arguments are: 10 arun admin