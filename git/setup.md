# Work specific git config

In `.gitconfig` add:
```
[includeIf "gitdir:~/work/"]
    path = .gitconfig-work
```
