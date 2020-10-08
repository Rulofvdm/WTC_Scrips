rm -rf all_details
wtc-lms reviews | grep "review_details" >> all_details.sh
chmod +x all_details.sh
./all_details.sh >> all_details
rm all_details.sh
