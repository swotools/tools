#!/usr/bin/env bash
GITREPO='develop';
echo ">>> Committing using git"
################################################## Prepara files
CURRENTBRANCH=$(git rev-parse --abbrev-ref HEAD)
REMOTE=$(git config --get remote.origin.url)
if [[ "$CURRENTBRANCH" != "$GITREPO" ]];then
  printf "Invalid branch! Currente branch is $CURRENTBRANCH\nCheckout to $GITREPO\n"
  exit 0;
fi
echo "Type message for commit and press [ENTER]:"
read MESSAGE
echo "Workgin on $REMOTE"
echo "Add files..."
git add -A
echo "Commit with $MESSAGE"
git commit -m "$MESSAGE"
git push origin $GITREPO
