# Style Guide

The details are not fully determined. This is only a draft.

## Symbols, etc

| Type       | Markup                                          | Displayed                                 | Notes                                                                                                |
| ---------- | ----------------------------------------------- | ----------------------------------------- | ---------------------------------------------------------------------------------------------------- |
| Code block | \`\`\` ... \`\`\`                               | Not possible                              |                                                                                                      |
| Code       | \` ... \`                                       | `...`                                     |                                                                                                      |
| Menu       | `<kbd>`Menu`</kbd>&rarr;<kbd>`Menu Item`</kbd>` | <kbd>Menu</kbd>&rarr;<kbd>Menu Item</kbd> | Perhaps use <button>Button</button> instead, or have cutsom `span`?                                  |
| Button     | `<button>`Button`</button>`                     | <button>Button</button>                   | Button is still clickable. The theme has no styling for `button`.                                    |
| Window     | `<u>`Window Name`</u>`                          | <u>Window Name</u>                        | Perhaps use **bold** instead? We could also have a custom `span` that highlights  the name in black. |
| Pane       | `**`Pane name`**`                               | **Pane name**                             | Really inconsistent to have lower-level elements to have a higher visibility.                                                                                                     |