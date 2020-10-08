# WTC_Scripts
Some scripts I wrote to help me get through the reviews process quicker.

# Do_review script 0.1
__Setup:__
  - Download : https://github.com/Rulofvdm/WTC_Scrips/archive/main.zip
  - Extract
  - Run setup.sh
    
 __Use:__
 
  __update_review_details.sh__
    - Go to `cd ~/`.
    - run `./update_reviews_info.sh`
      __YOU DON'T NEED TO RUN THIS IF YOU DON'T WANT IT. IT'S JUST USED TO HAVE AN EASY WAY TO ACCESS USERNAMES AND HASHES IN ONE PLACE__
      __NOTE: THIS TAKES A WHILE SO RUN IT IN A SEPERATE WINDOW__
      THIS PUTS OUT THE OUTPUT OF ALL review_details COMMANDS IN A FILE FOR EASY ACCESS TO USERNAMES AND HASHES
      MIGHT BECOME OBSOLETE IF UNCLE WOLF IMPLEMENTS THE --oneline FEATURE (ಥ﹏ಥ) 
    
   __do_review.sh(the useful one)__
   - Open a seperate terminal.
   - Run ```./do_review.sh```
   - Give reviewee username (This does nothing, yet, if you didn't run the update_review_details.sh)
   - Give hash for example 0ecf910e-94a2-4b4d-a3d2-7cdace88c069
   - Chrome is now opened with the review guidelines page.
   - It now prompts to sync the folder. Only do this right before the review.
   - VS Code is now opened at the synced directory.
   - At this time you will probably do the actual review
     so tab away from the terminal you ran this in.
   - When you're done with the review return to this terminal 
     where you basically need to type in your comment and then grade
     which will then be automatically posted.
   - After all that the repo is deleted as it would no longer be needed.
