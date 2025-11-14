# Git usual commands
In a terminal, type `git` followed by a space and the command.

## Initialization and checkout
| Command                  | Explanation                                 |
| :----------------------- |:--------------------------------------------|
| `clone [url]`            | Copy a remote repository locally            |
| `submodule update --init --recursive` | update submodules              | 
| `pull`                   | Fetch and merge changes from remote         |
| `branch`                 | List, create, or delete branches            |
| `checkout [branch]`      | Switch to another branch                    |
| `fetch`                  | Download objects and refs from remote       |


The first time I push a new branch, I should specify what branch on origin it should be pushed to (usually the same name) and that the local branch should track that remote branch (-u):
```bash
git push -u origin my_branch
```

## Status
|                          |                                             |
| :----------------------- |:--------------------------------------------|
| `status`                 | Show changed, staged, untracked files       |
| `diff`                   | Show changes not yet staged or committed    |
| `log`                    | Show commit history                         |

## Commit and push
|                          |                                             |
| :----------------------- |:--------------------------------------------|
| `add [file]`             | Stage file(s) for commit                    |
| `add --all`              | Stage all unstaged files for commit         |
| `commit -m "[msg]"`      | Save staged changes with a message          |
| `push`                   | Upload commits to remote repository         |
| `merge [branch]`         | Merge branch into current branch            |  
| `rm [file]`              | Remove file from working directory & index  |
| `stash`                  | Temporarily save changes                    |

## Submodules



## Problems
#### I have pushed a commit without a branch, how can I push it to a branch?
* If I am currently elsewhere and cannot see the pushed commmit, 
use `git fsck --unreachable --no-reflogs | grep commit` to find 
the commit hash. Then checkout it.
* use git push origin HEAD:branch_name to push the commit to the desired branch.