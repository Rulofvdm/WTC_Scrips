<!--
*** I'm using markdown "reference style" links for readability.
*** Reference links are enclosed in brackets [ ] instead of parentheses ( ).
*** See the bottom of this document for the declaration of the reference variables
*** for contributors-url, forks-url, etc. This is an optional, concise syntax you may use.
*** https://www.markdownguide.org/basic-syntax/#reference-style-links
-->

<!-- PROJECT SHIELDS -->

[![Contributors][contributors-shield]][contributors-url]
[![Forks][forks-shield]][forks-url]
[![Stargazers][stars-shield]][stars-url]

<!-- [![MIT License][license-shield]][license-url] -->

<!-- PROJECT LOGO -->

<br />
<p align="center">
  <a href="https://github.com/Kellan2002/Kellans-Scripts">
    <img src="Images/logo.png" alt="Logo" width="80" height="80">
  </a>

<h3 align="center">Student Scripts</h3>

<p align="center">
    This repo includes scripts for wtc-lms
    <br />
    <br />
    ·
    <a href="https://github.com/Kellan2002/Kellans-Scripts/issues">Report Bug</a>
    ·
    <a href="https://github.com/Kellan2002/Kellans-Scripts/issues">Request Feature</a>
    .
  </p>
</p>

<!-- TABLE OF CONTENTS -->

<details open="open">
  <summary><h2 style="display: inline-block">Table of Contents</h2></summary>
  <ol>
    <li>
      <a href="#about-the-project">About The Project</a>
      <ul>
        <li><a href="#built-with">Built With</a></li>
      </ul>
    </li>
    <li>
      <a href="#getting-started">Getting Started</a>
      <ul>
        <li><a href="#steps-to-run-script-on-wsl">WSL Install</a></li>
        <li><a href="#steps-to-run-script-on-linux">Linux</a></li>
      </ul>
    </li>
    <!-- <li><a href="#usage">Usage</a></li> -->
    <li><a href="#contributors">Contributors</a></li>
    <li><a href="#todo-list">TODO-List</a></li>
    <!-- <li><a href="#acknowledgements">Acknowledgements</a></li> -->
  </ol>
</details>

<!-- ABOUT THE PROJECT -->

# About The Projects

These projects are all built by WeThinkCode Students. 
Currently LMS is built to run on unix operating systems running a GNOME desktop environment. So for the requirement of LMS, you can't expect the script to work if you don't meet those requirements.

<!-- BUILT WITH -->

## Built With

* [Bash]()
* [Batch]()

<!-- MACOS -->

# Getting Started

## install_wtc_lms.sh

#### WSL:

1. Clone repository

```bash
git clone https://github.com/wethinkcode/student_scrips ~/wtc-scripts
```

2. Change to the directory the repo is now stored.

```bash
cd ~/wtc-scripts
```

3. Run script with bash.
   
   > *Do not run the script as root (i.e. with sudo)*

```bash
bash ./install_wtc_lms
```

#### Linux:

1. Will be added **SOON**!!!



## update_review_details.sh:

> run `setup.sh` before use of these scripts

- Go to `cd ~/`.

- Run: 
  
  ```bash
  ./update_reviews_info.sh
  ```

- **YOU DON'T NEED TO RUN THIS IF YOU DON'T WANT IT. IT'S JUST USED TO HAVE AN EASY WAY TO ACCESS USERNAMES AND HASHES IN ONE PLACE**  
  **NOTE: THIS TAKES A WHILE SO RUN IT IN A SEPERATE WINDOW**  
  THIS PUTS OUT THE OUTPUT OF ALL review_details COMMANDS IN A FILE FOR EASY ACCESS TO USERNAMES AND HASHES
  MIGHT BECOME OBSOLETE IF UNCLE WOLF IMPLEMENTS THE --oneline FEATURE (ಥ﹏ಥ)

## **do_review.sh(the useful one)**:

- Open a seperate terminal.
  
  ```bash
  ./do_review.sh
  ```

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

## **all_project_history.sh(extra)**:

- Open a seperate terminal.

- Run:
  
  ```bash
  ./all_project_history.sh
  ```

- For those that want to see all of their project history for semester 1

## **view_reviews.sh(on available reviews)**:

- Open a seperate terminal.

- Run:
  
  ```bash
  ./view_reviews.sh -p "FizzBuzz" -n 2 -a
  ```

- the -n flag is optional to change the amount of reviews you will see, default is 3

- the -a flag is also optional and instead of showing you the reviews it will ACCEPT them (use with or without the n flag)

- It is to view available reviews.

- BEWARE: the -a flag WILL ACCEPT reviews. DO NOT use the -a flag if you just want to view reviews.

- Otherwise you can run:
  
  ```bash
   ./view_reviews -u "username"
  ```

- To view the reviews you have been assigned for that user.

- Use at own risk. If you mess up your number of accepted reviews, that's on you,

# Contributors

*Here are the contributors LinkedIns*

[Kellan Stevens](https://www.linkedin.com/in/kellan-stevens/)

[Rulof van der Merwe](https://www.linkedin.com/in/rulof-vd-merwe/)

# TODO List

- **install_wtc_lms.sh**:
  
  . Get script to update wtc-lms if already installed
  
  . Fix WSL error when there is a space seperating a 2 worded username
  
  . Get script to run properly on bare linux
  
  . Get script to run and cleanup multiple install locations of lms (i.e. wtc-lms being stored in /usr/local/bin, /usr/bin, etc)
  
  . Get script to work with different WSL mount points
  
  . More to be expected

[contributors-shield]: https://img.shields.io/github/contributors/wethinkcode/student_scrips.svg?style=for-the-badge
[contributors-url]: https://github.com/wethinkcode/student_scrips/graphs/contributors
[forks-shield]: https://img.shields.io/github/forks/wethinkcode/student_scrips.svg?style=for-the-badge
[forks-url]: https://github.com/wethinkcode/student_scrips/network/members
[stars-shield]: https://img.shields.io/github/stars/wethinkcode/student_scrips.svg?style=for-the-badge
[stars-url]: https://github.com/wethinkcode/student_scrips/stargazers