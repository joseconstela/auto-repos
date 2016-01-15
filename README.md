# zsh auto-repo's plugin

Aliases to help you to manage large projects with many git, nodejs or bower apps directories.

It basically runs commands in all subfolders depending on each directory's nature. 

Originally designed as an [oh-my-zsh plugin](https://github.com/robbyrussell/oh-my-zsh/wiki/Plugins)

## Common commands. Runs in all sulfolders.
* `ara <command>` runs `<command>`

## Git commands. Runs in subfolders with a .git/config file
* `arg <command>` runs `<command>`
* `argp` runs `git pull`
* `argco <branch>` runs `git checkout` to the specified branch

## Bower commands. Runs in subfolders with a bower.json file
* `arb <command>` runs `<command>`
* `arbi` runs `bower install`
* `arbu` runs `bower update`

## NodeJS commands. Runs in subfolders with a packages.json file
* `arn <command>` runs `<command>`
* `arni` runs `npm install`
* `arnu` runs `npm update`
* `arnla <match>` grabs the list of package.json dependencies, and where it maches `match`, executes `npm link <the package name>`
* `arnl github` same as `arnla` but only in current directory

### Example
For all nodejs subfolders, created an npm link for each one of them, and link them according to repositories matching "github" in both the name or url in packages.json

`arn npm link; arnla github`