# Agenda
- Yesterday's solutions / buggy merge_sort
- Git Basics
- Git Branches
- Git Remotes

## Version Control System Basics
- A Version Control System (Git is the most popular one)
- Helps record changes to files by tracking modifications done to code
- Why?
  - Save project history
  - Revert to previous history
  - Merging work on a project
  - Very useful for collaboration

## Git Basics
- to clone an existing repository
  - `git clone <repo url>`
- to check status
  - `git status`
- to configure author(only need to be done once)
  - `git config --local user.username <username>`
  - `git config --local user.email <email>`
- to see differences we made in files
  - `git diff`
- to add files to staging area
  - `git add <filename with relative path>`
  - to add all the unstaged files
    - `git add -A` OR `git add .`
- to commit
  - `git commit -m "some message"`
    - for message, start with present tense verb followed by descriptive job done
- to see commit history of this repo
  - `git log`
  - `git log --oneline` 
    - for a quick snapshot
- to see which url that remote origin is pointing to
  - `git config --get remote.origin.url`

## Git Branches
- ** stash isn't tied to a specific branch
- to stash changes you've made
  - `git stash`
- to list everything you stashed
  - `git stash list`
- to apply a specific stash
  - `git stash apply <stash_identifier>`
  - if applying most recently added stash
    - `git stash apply`
- to list all branches
  - `git branch`
- to create a new branch
  - `git branch <new_branch_name>`
- to checkout another branch
  - `git checkout <name_of_branch>`
- to merge branches
  - first checkout the branch that you wish to merge onto
  - `git merge <name_of_branch>`

## Git Remotes
- to set origin destination
  - `git remote add origin <github .git url>`
- to push commits to remote repo
  - `git push <remote destination> <branch>`
  - to set upstream
    - `git push -u <remote destination> <branch>`
    - this allows you to leave out <remote destination>
      - ex) `git push master`

## Glossary
- Commit: 
  - single point in the git history(revision or version)
- Working directory: 
  - a single checkout of one version of the project
- Snapshot: 
  - a state of a repository. Committing is the action of storing a snapshot of the project's state in git history.
- Staging area: 
  - It stores info about what will go into the next commit.
- Git directory(repository): 
  - a virtual storage of your project


Git popularity: https://insights.stackoverflow.com/survey/2017
Branching: https://www.atlassian.com/git/tutorials/using-branches
Slides: https://docs.google.com/presentation/d/1Y6dbi-GeEKypUj5pRHN8K57MAVtI_SxZHrUHZ5eTcb8/edit?usp=sharing