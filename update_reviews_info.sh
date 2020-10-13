rm -rf all_details
wtc-lms reviews | grep -A 1 "Assigned" | grep "review" | sh > all_details
