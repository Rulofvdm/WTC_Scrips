rm -rf all_details
wtc-lms reviews | grep -A 1 "Grade" | grep "details" | sh >> all_details
