```sh
## ---------------------------------------------------------------------------------------------------
## version  1.5
## Library: https://github.com/Frankie116/my-library.git
## 
##  Git commands can be found here - https://git-scm.com/docs
## ---------------------------------------------------------------------------------------------------

## --------------------------------------------
## Status cmds
## --------------------------------------------



## Create empty Git repo in specified directory. 
git init <directory>



## Clone repo located at <repo> onto local machine.
git clone <repo>


## Define author name to be used for all commits in current repo. Devs commonly use --global flag to set config options for current user.
git config user.name <name>

git clone https://username@github.com/organization/repo.git


## Stage all changes in <directory> for the next commit. Or stage the specific file for next commit.
git add <directory>
git add <file>

git add .
git add readme.md



## Commit the staged snapshot, but instead of launching a text editor, use <message> as the commit message.
git commit -m "<message>"

## List which files are staged, unstaged, and untracked.
git status



## ---------------------------------------------------------------------------------------------------
## Display the entire commit history using the default format. For customization see additional options.
git log


## Show unstaged changes between your index and working directory.
git diff


## Replace the last commit with the staged changes and last commit combined. Use with nothing staged to edit the last commit’s message.
git commit --amend


## Rebase the current branch onto <base>. <base> can be a commit ID, branch name, a tag, or a relative reference to HEAD.
git rebase <base>


## Show a log of changes to the local repository’s HEAD.
## Add --relative-date flag to show date info or --all to show all refs.
git reflog








# ----------------------------------------------------------------------------------------------
#  GIT BRANCHES
# ----------------------------------------------------------------------------------------------


## List all of the branches in your repo. Add a <branch> argument to create a new branch with the name <branch>.
git branch


## Create and check out a new branch named <branch>. Drop the -b flag to checkout an existing branch.
git checkout -b <branch>


## Merge <branch> into the current branch.
git merge <branch>

## Copy branch from remote repo to local repo
git branch -f dev origin/dev




# ----------------------------------------------------------------------------------------------
#  REMOTE REPOSITORIES
# ----------------------------------------------------------------------------------------------

git remote -v

## Create a new connection to a remote repo. After adding a remote, you can use <name> as a shortcut for <url> in other commands.
git remote add <name> <url>

i.e
git remote add origin https://yourusername@github.com/user/repo.git


## Add a url mapping to an existing repo
git remote set-url --add origin https://yourusername@github.com/user/repo.git



## delete a url mapping to an existing repo
git remote set-url --delete origin https://github.com/Frankie116/CLOUDFORMATION-modules.git


## change the 
git remote set-url origin https://yourusername@github.com/user/repo.git



## Fetches a specific <branch>, from the repo. Leave off <branch> to fetch all remote refs.
git fetch <remote> <branch>


## Fetch the specified remote’s copy of current branch and immediately merge it into the local copy.
git pull <remote>


## Push the branch to <remote>, along with necessary commits and objects. Creates named branch in the remote repo if it doesn’t exist.
git push <remote> <branch>





# ----------------------------------------------------------------------------------------------
# UNDOING CHANGES
# ----------------------------------------------------------------------------------------------

git revert <commit>

## Create new commit that undoes all of the changes made in <commit>, then apply it to the current branch.

git reset <file>

## Remove <file> from the staging area, but leave the working directory unchanged. This unstages a file without overwriting any changes.

git clean -n

## Shows which files would be removed from working directory. Use the -f flag in place of the -n flag to execute the clean.



# ----------------------------------------------------------------------------------------------
# Additional Options +
# ----------------------------------------------------------------------------------------------
GIT CONFIG
GIT DIFF
GIT RESET

## Define the author name to be used for all commits by the current user.
git config --global user.name <name>


## Define the author email to be used for all commits by the current user.
git config --global user.email <email>


## Create shortcut for a Git command. E.g. alias.glog “log --graph --oneline” will set ”git glog”equivalent to ”git log --graph --oneline.
git config --global alias. <alias-name> <git-command>


## Set text editor used by commands for all users on the machine. <editor> arg should be the command that launches the desired editor (e.g., vi).
git config --system core.editor <editor>


## Open the global configuration file in a text editor for manual editing.
git config --global --edit


## Show difference between working directory and last commit.
git diff HEAD


## Show difference between staged changes and last commit
git diff --cached


## Reset staging area to match most recent commit, but leave the working directory unchanged.
git reset


## Reset staging area and working directory to match most recent commit and overwrites all changes in the working directory.
git reset --hard


## Move the current branch tip backward to <commit>, reset the staging area to match, but leave the working directory alone.
git reset <commit>


## Same as previous, but resets both the staging area & working directory to match. Deletes uncommitted changes, and all commits after <commit>.
git reset --hard <commit>


# ----------------------------------------------------------------------------------------------
# GIT LOG
# ----------------------------------------------------------------------------------------------

## Limit number of commits by <limit>. E.g. ”git log -5” will limit to 5 commits.
git log -<limit>


## Condense each commit to a single line.
git log --oneline


## Display the full diff of each commit.
git log -p


## Include which files were altered and the relative number of lines that were added or deleted from each of them.
git log --stat


## Search for commits by a particular author.
git log --author= ”<pattern>”


## Search for commits with a commit message that matches <pattern>.
git log --grep=”<pattern>”


## Show commits that occur between <since> and <until>. Args can be a commit ID, branch name, HEAD, or any other kind of revision reference.
git log <since>..<until>


## Only display commits that have the specified file.
git log -- <file>


## --graph flag draws a text based graph of commits on left side of commit msgs. --decorate adds names of branches or tags of commits shown.
git log --graph --decorate



GIT REBASE
GIT PULL
GIT PUSH

## Interactively rebase current branch onto <base>. Launches editor to enter commands for how each commit will be transferred to the new base.
git rebase -i <base>


## Fetch the remote’s copy of current branch and rebases it into the local copy. Uses git rebase instead of merge to integrate the branches.
git pull --rebase <remote>


# Forces the git push even if it results in a non-fast-forward merge. Do not use the --force flag unless you’re absolutely sure you know what you’re doing.
git push <remote>  --force


## Push all of your local branches to the specified remote.
git push <remote> --all


## ags aren’t automatically pushed when you push a branch or use the --all flag.The--tagsflagsendsallofyourlocaltagstotheremoterepo.
git push <remote> --tags


# ----------------------------------------------------------------------------------------------
## push a branch in repo to a new repo.  push to a new branch called master...
# https://stackoverflow.com/questions/2227062/how-do-i-move-a-git-branch-out-into-its-own-repository

git push https://github.com/Frankie116/APP05-wordpress-lb.git f06-jumpbox:master

# ----------------------------------------------------------------------------------------------



# ----------------------------------------------------------------------------------------------
# ----------------------------------------------------------------------------------------------
# create a new repository on the command line
# ----------------------------------------------------------------------------------------------
# ----------------------------------------------------------------------------------------------
echo "# APP01-mongodb" >> README.md
git init
git add README.md
git commit -m "first commit"
git branch -M main
git remote add origin https://github.com/Frankie116/APP01-mongodb.git
git push -u origin main

# ----------------------------------------------------------------------------------------------
# ----------------------------------------------------------------------------------------------
# …or push an existing repository from the command line
# ----------------------------------------------------------------------------------------------
# ----------------------------------------------------------------------------------------------
git remote add origin https://github.com/Frankie116/APP01-mongodb.git
git branch -M main
git push -u origin main