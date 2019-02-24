# Contributing

As this is a repo with many direct collaborators, some basic rules should be followed to prevent messy commit history and/or broken merges.

* `pull` the latest repo *frequently* to make sure you're up to date with everyone else's changes.
* If you have changes and are unable to `pull` due to conflics, do **NOT** do a merge commit! This puts a ton of messy messages into the commit history. Do a `rebase` instead! This rewinds your work, pulls master so you're up to date, and then re-applies your changes. 
* If you are planning a LARGE project (more than a day or so of work, more than a few commits, touches lots of files, major refactors, leaves the repo temporarily broken, etc), do it in a `branch` instead of in `master`. When you're done, make a pull request on Github to apply all the changes at once. 
* Please do **NOT** force-push the repo **UNLESS** you are on your own branch or know **EXACTLY** what you're doing. This can easily and irreversably erase history and break things.
* If you have any questions about `git` (such as cherry-picking or synching your branch to the remote upstream or whatever), ask Caligari87 or use the `git help <command>` function and/or Google until you feel comfortable achieving what you want.
