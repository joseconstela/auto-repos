# zsh auto-repo's plugin

Aliases to help you to manage large development projects with many repositories. It runs git/npm commands in subfolders depending on each subfolder's nature.

Originally designed as an [oh-my-zsh plugin](https://github.com/robbyrussell/oh-my-zsh/wiki/Plugins)

# Aliases

* `ara <command>` runs `<command>` in any subfolders
* `arn <command>` runs `<command>` in nodejs subfolders
* `arg <command>` runs `<command>` in gits subfolders

# Other aliases

* `arni` runs `npm install`
* `arnu` runs `npm update`
* `argp` runs `git pull`
* `arnl github` grabs the list of package.json dependencies, and runs `npm link <depName>` where its name or repo's url matches `github` - in the current folder
* `arnla github` same as `arnl` but executes in all subfolders
* `argco <branch>` runs `git checkout` to the specified branch
