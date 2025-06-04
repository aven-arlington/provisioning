# Customizing the Terminal

## My Personal Custom Prompt

Note the presence of `$` before the single quote expands the string, with backslash-escaped characters in string replaced as specified by the ANSI C standard. [Source](https://www.gnu.org/software/bash/manual/html_node/ANSI_002dC-Quoting.html#ANSI_002dC-Quoting)

```bash
source ~/.git-prompt.sh
get_now() {
    date +'%Y-%m-%d %H:%M:%S'
}
PS1=$'\[\u001B]0;\h: \w\a\]\[\u001B[38;2;224;175;104m${debian_chroot:+($debian_chroot)}\]\[\u001B[38;2;115;218;202m\h\]\[\u001B[38;2;192;202;245m: \]\[\u001B[38;2;122;162;247m\w\]\[\u001B[38;2;247;118;142m$(__git_ps1 " (%s)")\]\[\u001B[38;2;54;59;84m - $(get_now)\n\]\[\u001B[38;2;192;202;245m>\]'

# Optional for hostname colors based on hash values
# Requires installation of host_colo_rs
export HOSTCOLOR=$(host_colo_rs)
PS1=$'\[\u001B]0;\h: \w\a\]\[\u001B[38;2;224;175;104m${debian_chroot:+($debian_chroot)}\]\[$HOSTCOLOR\]\[\u001B[38;2;192;202;245m: \]\[\u001B[38;2;122;162;247m\w\]\[\u001B[38;2;247;118;142m$(__git_ps1 " (%s)")\]\[\u001B[38;2;54;59;84m - $(get_now)\n\]\[\u001B[38;2;192;202;245m>\]'

```

## Custom Prompt Quick Reference

Certain meta data is made available through handy escape sequences that can be embedded in the command prompt.

Escape Sequences

|       Code        |             Character             |
| :---------------: | :-------------------------------: |
|        \d         |           Current date            |
|    \D{format}     |            Date format            |
|        \e         |         Escape character          |
|     \h or \H      |             Hostname              |
|        \n         |              Newline              |
|        \r         |          Carriage return          |
|        \t         |   Current time 24-hour HH:MM:SS   |
|        \T         |   Current time 12-hour HH:MM:SS   |
|        \@         | Current time 12-hour HH:MM am/pm  |
|        \A         |    Current time 24-hour HH:MM     |
|        \u         |     Username of current user      |
|        \w         | Path to current working directory |
|        \W         |   Basename of working directory   |
|    &#92;&#92;     |             Backslash             |
| &#92;[ and &#92;] |   Begin and end escape sequence   |

We can test different escape codes with the `-e` option of `echo` to see the colors and effects.

The `\e[0m` sequence removes all attributes (formatting and colors). It can be a good idea to add it at the end of each colored text.

```bash
echo -e "\033[31mHello\e[0m World"
```

Non-printing sequences, e.g. for setting the title bar text, can optionally be surrounded with `\[` and `\]`

Operating System Commands (OSC) are denoted with a escape followed by a closing bracket and code, i.e. `\e]0;` which instructs the OS to set the title of the window.

Example from around line 70 of a standard `.bashrc` file where the title is set if the terminal is `xterm*`

```bash
PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
```

For 256 colors, the control sequence format is `<Esc>[38;5;` + `Color Number` + `m`

`<Esc>` is a placeholder for `\e`, `\033`, or `\x1B`.

The rest is the control sequence `[38;5;xxxm` where xxx represents one of the 256 numbers.

A complete example could be `echo -e "\e[38;5;82mHello \e[38;5;198mWorld"`

If a [terminal supports it](https://github.com/termstandard/colors), full RGB color control sequences are of the format `\e[38;2;<0dRed>;<0dGreen>;<0dBlue>m`.

[An amazing reference for understanding terminal prompt color escape sequences](https://misc.flogisoft.com/bash/tip_colors_and_formatting)

The table and script below demonstrate full RGB colors from the Tokyo Night theme from VS Code and Folke's port to NeoVim.

|   Terminal Color   |  VS Tokyo Night RGB   |       NVIM RGB        |                                        Test                                         |
| :----------------: | :-------------------: | :-------------------: | :---------------------------------------------------------------------------------: |
|     Background     |  #16161e (22;22;30)   |  #1a1b26 (26;27;38)   |    `echo -e "\e[38;2;22;22;30mBackground\e[0m \e[38;2;26;27;38mBackground\e[0m"`    |
|     Foreground     | #787c99 (120;124;153) | #c0caf5 (192;202;245) | `echo -e "\e[38;2;120;124;153mForeground\e[0m \e[38;2;192;202;245mForeground\e[0m"` |
|     ANSI Black     |  #363b54 (54;59;84)   |  #15161e (21;22;30)   |         `echo -e "\e[38;2;54;59;84mBlack\e[0m \e[38;2;21;22;30mBlack\e[0m"`         |
|      ANSI Red      | #f7768e (247;118;142) | #f7768e (247;118;142) |        `echo -e "\e[38;2;247;118;142mRed\e[0m \e[38;2;247;118;142mRed\e[0m"`        |
|     ANSI Green     | #73daca (115;218;202) | #9ece6a (158;206;106) |      `echo -e "\e[38;2;115;218;202mGreen\e[0m \e[38;2;158;206;106mGreen\e[0m"`      |
|    ANSI Yellow     | #e0af68 (224;175;104) | #e0af68 (224;175;104) |     `echo -e "\e[38;2;224;175;104mYellow\e[0m \e[38;2;224;175;104mYellow\e[0m"`     |
|     ANSI Blue      | #7aa2f7 (122;162;247) | #7aa2f7 (122;162;247) |       `echo -e "\e[38;2;122;162;247mBlue\e[0m \e[38;2;122;162;247mBlue\e[0m"`       |
|    ANSI Magenta    | #bb9af7 (187;154;247) | #bb9af7 (187;154;247) |    `echo -e "\e[38;2;187;154;247mMagenta\e[0m \e[38;2;187;154;247mMagenta\e[0m"`    |
|     ANSI Cyan      | #7dcfff (125;207;255) | #7dcfff (125;207;255) |       `echo -e "\e[38;2;125;207;255mCyan\e[0m \e[38;2;125;207;255mCyan\e[0m"`       |
|     ANSI White     | #787c99 (120;124;153) | #a9b1d6 (169;177;214) |      `echo -e "\e[38;2;120;124;153mWhite\e[0m \e[38;2;169;177;214mWhite\e[0m"`      |
|  ANSI BrightBlack  |  #363b54 (54;59;84)   |  #414868 (65;72;104)  |     `echo -e "\e[38;2;54;59;84mBr.Black\e[0m \e[38;2;65;72;104mBr.Black\e[0m"`      |
|   ANSI BrightRed   | #f7768e (247;118;142) | #ff899d (255;137;157) |     `echo -e "\e[38;2;247;118;142mBr.Red\e[0m \e[38;2;255;137;157mBr.Red\e[0m"`     |
|  ANSI BrightGreen  | #73daca (115;218;202) | #9fe044 (159;224;68)  |   `echo -e "\e[38;2;115;218;202mBr.Green\e[0m \e[38;2;159;224;68mBr.Green\e[0m"`    |
| ANSI BrightYellow  | #e0af68 (224;175;104) | #faba4a (250;186;74)  |  `echo -e "\e[38;2;224;175;104mBr.Yellow\e[0m \e[38;2;250;186;74mBr.Yellow\e[0m"`   |
|  ANSI BrightBlue   | #7aa2f7 (122;162;247) | #8db0ff (141;176;255) |    `echo -e "\e[38;2;122;162;247mBr.Blue\e[0m \e[38;2;141;176;255mBr.Blue\e[0m"`    |
| ANSI BrightMagenta | #bb9af7 (187;154;247) | #c7a9ff (199;169;255) | `echo -e "\e[38;2;187;154;247mBr.Magenta\e[0m \e[38;2;199;169;255mBr.Magenta\e[0m"` |
|  ANSI BrightCyan   | #7dcfff (125;207;255) | #a4daff (164;218;255) |    `echo -e "\e[38;2;125;207;255mBr.Cyan\e[0m \e[38;2;164;218;255mBr.Cyan\e[0m"`    |
|  ANSI BrightWhite  | #acb0d0 (172;176;208) | #c0caf5 (192;202;245) |   `echo -e "\e[38;2;172;176;208mBr.White\e[0m \e[38;2;192;202;245mBr.White\e[0m"`   |

```bash
#!/bin/bash
colors=(
    "\e[38;2;22;22;30mBackground\e[0m \e[38;2;26;27;38mBackground\e[0m"
    "\e[38;2;120;124;153mForeground\e[0m \e[38;2;192;202;245mForeground\e[0m"
    "\e[38;2;54;59;84mBlack\e[0m \e[38;2;21;22;30mBlack\e[0m"
    "\e[38;2;247;118;142mRed\e[0m \e[38;2;247;118;142mRed\e[0m"
    "\e[38;2;115;218;202mGreen\e[0m \e[38;2;158;206;106mGreen\e[0m"
    "\e[38;2;224;175;104mYellow\e[0m \e[38;2;224;175;104mYellow\e[0m"
    "\e[38;2;122;162;247mBlue\e[0m \e[38;2;122;162;247mBlue\e[0m"
    "\e[38;2;187;154;247mMagenta\e[0m \e[38;2;187;154;247mMagenta\e[0m"
    "\e[38;2;125;207;255mCyan\e[0m \e[38;2;125;207;255mCyan\e[0m"
    "\e[38;2;120;124;153mWhite\e[0m \e[38;2;169;177;214mWhite\e[0m"
    "\e[38;2;54;59;84mBr.Black\e[0m \e[38;2;65;72;104mBr.Black\e[0m"
    "\e[38;2;247;118;142mBr.Red\e[0m \e[38;2;255;137;157mBr.Red\e[0m"
    "\e[38;2;115;218;202mBr.Green\e[0m \e[38;2;159;224;68mBr.Green\e[0m"
    "\e[38;2;224;175;104mBr.Yellow\e[0m \e[38;2;250;186;74mBr.Yellow\e[0m"
    "\e[38;2;122;162;247mBr.Blue\e[0m \e[38;2;141;176;255mBr.Blue\e[0m"
    "\e[38;2;187;154;247mBr.Magenta\e[0m \e[38;2;199;169;255mBr.Magenta\e[0m"
    "\e[38;2;125;207;255mBr.Cyan\e[0m \e[38;2;164;218;255mBr.Cyan\e[0m"
    "\e[38;2;172;176;208mBr.White\e[0m \e[38;2;192;202;245mBr.White\e[0m"
)

for c in ${colors[@]}; do
    echo -e $c
done
```

Nice [summary](https://stackoverflow.com/questions/6245570/how-do-i-get-the-current-branch-name-in-git) of the different ways to detect the branch and handle the exceptional cases.

[Official Git Prompt Script](https://raw.githubusercontent.com/git/git/refs/heads/master/contrib/completion/git-prompt.sh)

```bash
# Download and source the official git-prompt script
curl -o .git-prompt.sh  https://raw.githubusercontent.com/git/git/refs/heads/master/contrib/completion/git-prompt.sh
printf "source ~/.git-prompt.sh\n" >> ~/.bashrc
# Then add this to the PS1
PS1='$PS1$(__git_ps1 " (%s)")'
```
