# My dot-files

## Setup

In order to install and configure your environment use:

```
wget https://raw.githubusercontent.com/pgt/dot-files/master/app.sh; sudo chmod +x app.sh; ./app.sh start
```

This will work on MacOS.

## Static analysis [Shellshock]

Inside your dot-files repository:

```
./app.sh static_analysis_tool
```

## Architecture of bash scripts

TODO: Show the tree output and explains the directories

## Keybindings

| Keybiding        | Explanation                                      |
| ----------------:| ------------------------------------------------:|
| C-x C-r          | Reload the `.inputrc`                            |
| C-x h            | Show all available keybidings in `.inputrc`      |
| C-x u            | Add sudo to current command                      |
| C-x pp           | Switch project                                   |
| C-x k            | Kill process                                     |
| C-x C-f          | Find a file in the current project               |
| C-x ,a           | Run rspec tests in the current project           |
| C-x ,v           | Run a specific rspec test in the current project |
| C-x  .           | Go back to the last directory                    |


### Change project (Emacs stylish)

**C-x pp**

Example

### iTerm configurations

Add in iTerm2 the following Profile Shortcut Keys

```
FOR  ACTION         SEND
⌘←  "HEX CODE"      0x01
⌘→  "HEX CODE"      0x05
⌥←  "SEND ESC SEQ"  b
⌥→  "SEND ESC SEQ"  f
Here is a visual for those who need it
```

iTerm add key visual

![](/readme/iterm-configs.png)
