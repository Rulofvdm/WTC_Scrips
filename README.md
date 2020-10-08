# WTC_Scripts
Some scripts I wrote to help me get through the reviews process quicker.

# Do_review script 0.1
__Setup:__
  - Download : https://github.com/Rulofvdm/WTC_Scrips/archive/main.zip
  - Extract
  - Run `cd ~/Downloads/WTC_Scrips-main`
  - Run setup.sh
    
__Use:__</br></br>
	__update_review_details.sh__</br>
	- Go to `cd ~/`.</br>
	- run `./update_reviews_info.sh`</br>
		__YOU DON'T NEED TO RUN THIS IF YOU DON'T WANT IT. IT'S JUST USED TO HAVE AN EASY WAY TO ACCESS USERNAMES AND HASHES IN ONE PLACE__</br>
		__NOTE: THIS TAKES A WHILE SO RUN IT IN A SEPERATE WINDOW__</br>
		THIS PUTS OUT THE OUTPUT OF ALL review_details COMMANDS IN A FILE FOR EASY ACCESS TO USERNAMES AND HASHES</br>
		MIGHT BECOME OBSOLETE IF UNCLE WOLF IMPLEMENTS THE --oneline FEATURE (ಥ﹏ಥ) </br></br>
	__do_review.sh(the useful one)__</br>
	- Open a seperate terminal.</br>
	- Run ```./do_review.sh```</br>
	- Give reviewee username (This does nothing, yet, if you didn't run the update_review_details.sh)</br>
	- Give hash for example 0ecf910e-94a2-4b4d-a3d2-7cdace88c069</br>
	- Chrome is now opened with the review guidelines page.</br>
	- It now prompts to sync the folder. Only do this right before the review.</br>
	- VS Code is now opened at the synced directory.</br>
	- At this time you will probably do the actual review</br>
	 so tab away from the terminal you ran this in.</br>
	- When you're done with the review return to this terminal </br>
	 where you basically need to type in your comment and then grade</br>
	 which will then be automatically posted.</br>
	- After all that the repo is deleted as it would no longer be needed.</br>
