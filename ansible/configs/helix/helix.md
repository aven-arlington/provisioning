# Helix Navigation and Configuration

[Source](https://www.youtube.com/watch?v=HcuDmSb-JBU)

[Documentation](https://docs.helix-editor.com/keymap.html#changes)

| Key                 | Operation                                                         |
| :------------------ | :---------------------------------------------------------------- |
| i, a                | Work similar to Vim but work around current selection             |
| c                   | Change selection (delete and enter insert mode)                   |
| w                   | move forward a word                                               |
| b                   | Move back a word                                                  |
| u                   | Undo                                                              |
| t<next_char>        | Select until next_char                                            |
| f<next_char>        | Move forward until next_char                                      |
| g<dest>             | Move to destination (has helpful popup)                           |
| g-d                 | Goto definition of symbol                                         |
| g-r                 | Open picker for all references to symbol                          |
| g-w                 | Jump to two-character label                                       |
| v                   | Select Mode - append to selection (like visual mode in Vim)       |
| ;                   | Remove highlighted selection                                      |
| Ctrl-c              | Comment a line                                                    |
| /                   | Search for regex pattern                                          |
| ?                   | Repeat search                                                     |
| n                   | Select next match                                                 |
| \* (keypad key)     | Search selection, wrapping with \b on word boundaries             |
| space-?             | Keybinding help, search bindings with %<column_header>            |
| space-f             | File picker                                                       |
| space-s             | (file) Open the symbol picker to fuzzy find variables etc.        |
| space-S             | (project) Open the symbol picker with project scope.              |
| space-d             | Diagnostic picker for errors and warnings etc.                    |
| space-j             | Picker for saved locations (similar to marks in Vim)              |
| space-g             | Git diff picker                                                   |
| space-r             | Rename symbol                                                     |
| Ctrl-v              | Open picked file in vertical split                                |
| Ctrl-n, Ctrl-p, Tab | Navigate picker                                                   |
| Ctrl-o, Ctrl-i      | Traverse jump-list breadcrumb history                             |
| [d, ]d              | Cycle forward/backward through diagnostic issues.                 |
| [f, ]f              | Cycle functions                                                   |
| [g, ]g              | Cycle through Git tracked changes                                 |
| Alt-o, Alt-i        | Walk syntax tree                                                  |
| Alt-c               | Change selection (same as c, no yanking)                          |
| Ctrl-s              | Save location to jump-list                                        |
| % register          | Special register that holds the name of the buffer (C++ headers?) |
| not-default-bound   | :reset-diff-change - Undo for the specific line of changed code   |

Pressing "w" repeatedly will go to the beginning/end of the word while highlighting from start to end. This follows the Helix design philosophy where the object is highlighted first and then the verb action key is pressed.
