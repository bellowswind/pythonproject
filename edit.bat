
git rebase --committer-date-is-author-date



-----------How to get all history including auther and committer user and date
https://stackoverflow.com/questions/14243380/how-to-configure-git-log-to-show-commit-date

git log --pretty-fuller

-----------How to change auther date
git commit --amend --date="2010-03-11T11:20:10±00:01" -C f666e41e596e40b6dacb30ac5004f3ed4dff6a7c


-----------How to change committer date
https://stackoverflow.com/questions/28536980/git-change-commit-date-to-author-date