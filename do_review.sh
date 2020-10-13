#!/bin/bash

read -p 'Username: ' username
grep -B 7 -A 3 "/$username" all_details
read -p 'Hash: ' hash
wtc-lms review_details $hash | grep 'Problem:'
site=$(wtc-lms review_details $hash | grep 'Review Guidelines:' | tr ' ' "\n" | tail -n 1)
google-chrome $site > /dev/null 2>&1 &
read -p 'Sync[y/n]: ' sync
if [ "$sync" == "y" ]
then
	loc=$(wtc-lms review_details $hash | grep 'Location:' | tr ' ' "\n" | tail -n 1)
	rm -rf $loc
	wtc-lms sync_review $hash
	code $loc
fi
read -p 'Comment: ' comment
wtc-lms add_comment $hash "$comment"
read -p 'Grade: ' grade
wtc-lms grade_review $hash $grade
rm -rf $loc
