## Short Description

For my final project, I did small parts of two projects. First the first portion of my project, I wrote a Python script to access the Vote Smart API candidates bios, nesting a for loop and the __getattribute__ method inside of a try and except framework. I included only the first ten entries of the data in the results file instead of the full dataset because it would be unfair for me to post their data for free online. However, I have included a failed candidates ID list, so for anyone who wants to rerun the code, they can skip those broken IDs. I was specifically interested in the profession data, so I used R to create and clean the corpus of the profession data column. I saved a wordcloud visualization of the profession data in the results folder.

For the second part of my project, I used Qualtrics to design a survey that will test people's knowledge and tag a Facebook pixel on them. The layout of the survey is in the code directory with the questions. Gabe and I just finished our trial run on MTurk but I do not want to post the data because we promised respondents that the data would be "stored in a secure location," and therefore, I think they have a reasonable expectation that it will not be public.

## Dependencies

1. R, version 3.3.1
2. Python, version 2.7, Anaconda distribution.

## Files

List all other files contained in the repo, along with a brief description of each one, like so:

#### Data

1. CandidateBios.csv: The first ten candidates returned from the Vote Smart API using my API code.
    - *Candidate ID*: The Vote Smart assigned ID of each candidate
    - *crpID*: The Open Secrets assigned ID of each candidate in Open Secret's database
    - *firstName*: The candidate's first name
    - *nickName*: The candidate's nickname
    - *middleName*: The candidate's middle name
    - *lastName*: The candidate's last name
    - *suffix*: The candidate's suffix
    - *birthDate*: The candidate's date of birth
    - *birthPlace*: The candidate's place of birth
    - *pronunciation*: The candidate's name's pronunciation
    - *gender*: The candidate's gender
    - *family*: The candidate's family members
    - *homeCity*: The candidate's home city
    - *homeState*: The candidate's home state
    - *education*: The candidate's education
    - *profession*: The candidate's professional experience
    - *political*: The candidate's political experience
    - *religion*: The candidate's professed religion
    - *congMembership*: The candidate's bureaucratic experience
    - *orgMembership*: The candidate's organization memberships
    - *specialMsg*: Any extra information on the candidate
2. FailedCandidateBios.csv: The list of candidate IDs that did not work
    
#### Code

1. 01_collect_data.ipynb: collects Vote Smart API data 
2. 02_clean-and-visualize.R: cleans profession data, creates corpus, visualizes wordcloud
3. 03_Qualtrics_survey.pdf: layout of Qualtrics survey on digital ads

#### Results

1. Profession_Wordcloud.png: wordcoud visualization of the profession data

## More Information

If you have any questions or comments, email me at alanyan@berkeley.edu.

