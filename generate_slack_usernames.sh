usernames=$(cat all_details| grep "Author" | tr " " "\n" | tr "@" "\n" | awk 'NR % 4 == 3')
echo $usernames | sed 's/ / @/g' | sed 's/^/@/'
