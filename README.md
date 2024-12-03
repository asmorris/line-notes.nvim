# Line Notes

**Line_Notes.nvim** is a Neovim plugin to mark specific lines in your code and add notes for future reference. It is meant as a supplement to code comments that you might want to add but don't need or want to be public, or small quick notes to yourself that are tied to a particular line, and are a quicker alternative to Obsidian or Notion or similar.

## Demo
![lineNotes](https://github.com/user-attachments/assets/b361cf26-4d23-4eca-8e10-81a8fcf68954)


## Features

- Add marks with notes to specific lines. Just press enter and you're good to go!
- List all marks and notes using Telescope.
- Navigate to marked lines directly from the list.
- Delete existing notes
- Edit existing notes, just need to close the floating window with the note.

## Installation

Using `lazy.nvim`:

```lua
{
    "asmorris/line_notes.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    config = function()
        require('line_notes').setup({
            -- Optional: Add your custom configuration here
        })
    end
}
```

## Default Configuration

The plugin comes with sensible defaults, but you can customize them to your liking. Here's the default configuration:

```lua
require('line_notes').setup({
    -- Customize keymaps
    keymaps = {
        add_note = "an",    -- Add a new note
        list_notes = "ln",  -- Open telescope picker with all notes
        delete_note = "dn", -- Delete note on current line
        show_note = "sn"    -- Show/edit note on current line
    },
    -- Customize note appearance
    signs = {
        note_icon = "🗒️",         -- Icon shown in the sign column
        highlight = "Comment",     -- Highlight group for the icon
        number_highlight = ""      -- Highlight group for line numbers (empty for no highlight)
    }
})
```
