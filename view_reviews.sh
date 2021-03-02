#!/bin/sh

p_flag=false
n_flag=false
a_flag=false
u_flag=false

while getopts 'p:n:au:' flag
do
    case "$flag" in
        p) 
	   PROJECT=$OPTARG
	   p_flag=true
	   ;;
        n) 
	   NUMBER=$OPTARG
	   n_flag=true
	   ;;
	a) 
	   a_flag=true
	   ;;
        u) 
	   USERNAME=$OPTARG
	   u_flag=true
	   ;;
    esac
done

if [ "$n_flag" = true ] && [ "$p_flag" = true ] && [ "$a_flag" = false ]
then
  wtc-lms reviews 2>/dev/null | grep "Invited" -A2 | grep "$PROJECT" -A2 -m "$NUMBER"
elif [ "$n_flag" = true ] && [ "$p_flag" = true ] && [ "$a_flag" = true ]
then
  wtc-lms reviews 2>/dev/null | grep "Invited" -A2 | grep "$PROJECT" -A2 -m "$NUMBER" | grep "accept" | sh
elif [ "$p_flag" = true ] && [ "$a_flag" = true ]
then
  wtc-lms reviews 2>/dev/null | grep "Invited" -A2 | grep "$PROJECT" -A2 -m 3 | grep "accept" | sh
elif [ "$p_flag" = true ]
then
  wtc-lms reviews 2>/dev/null | grep "Invited" -A2 | grep "$PROJECT" -A2 -m 3
elif [ "$u_flag" = true ] && [ "$p_flag" = false ] && [ "$n_flag" = false ] && [ "$a_flag" = false ]
then
  wtc-lms reviews | grep "Assigned" -A1 | grep "review_details" | sh | grep "$USERNAME" -A3 -B5
else
  echo "Enter -p \"Project Name\" (optional number of projects to see) -n 3 (optional, to accept) -a OR -u \"Username\""
fi

