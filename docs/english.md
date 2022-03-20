# Documentation

## illustrate

This is a neovim configuration project that I use, all written in Lua language, with many very useful plugins built in.

It starts up really fast because I lazy load 90% of my plugins:

<img src="https://images-1302522496.cos.ap-nanjing.myqcloud.com/img/202203102201493.png"/>

I will keep updating the configuration here to make it more and more user-friendly.

## content

Directory listing:

```
.
├── init.lua
├── docs
│   ├── chinese.md
│   └── english.md
├── ftplugin
│   └── ...
├── lint
│   └── ...
├── lua
│   ├── configure
│   │   ├── dap
│   │   │   └── ...
│   │   ├── lsp
│   │   │   └── ...
│   │   └── plugins
│   │       └── ...
│   ├── core
│   │   ├── after.lua
│   │   ├── keybinds.lua
│   │   ├── options.lua
│   │   ├── plugins.lua
│   │   └── settings.lua
│   └── tools
│       ├── scripts.lua
│       └── utils.lua
├── README.md
├── resource
│   └── ...
└── snippet
    └── ...
```

First-level directory description:

- docs: store the README documents in different languages of the project
- ftplugin: store indentation rule files of different file types
- lint: store lint configuration files in different languages
- lua: home directory program
- resource: store various external resource files, such as alacritty configuration files

Secondary directory description:

- lua/configure: store configuration files such as plugins, LSP, DAP, etc.
- lua/core: store the core configuration file
- lua/tools: some external command libraries

Three-level directory description:

- dap: store DAP configuration in various languages
- lsp: store LSP configurations in various languages
- plugins: store various plugin configurations

File Description:

- lua/core/after.lua: store all the script commands that run after the configuration is loaded, such as input method switching
- lua/core/keybinds.lua: store shortcut key configuration for all plugins and personal configuration
- lua/core/options.lua: store some global personal, plug-in and other configurations
- lua/core/settings.lua: stores all neovim built-in configuration options
- lua/core/plugins.lua: store all third-party plugins that the project depends on

## dependencies

Basic dependencies:

- [neovim > 0.5](https://link.zhihu.com/?target=https%3A//github.com/neovim/neovim/releases/latest)
- [gcc](https://gcc.gnu.org/)
- [nerd font](https://link.zhihu.com/?target=https%3A//www.nerdfonts.com/)
- [fd](https://link.zhihu.com/?target=https%3A//github.com/sharkdp/fd)
- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [translate-shell](https://github.com/soimort/translate-shell)

Other dependencies:

- tar curl git gzip wget
- node npm
- xsel

## language

It now supports the following languages with which you can happily write programs with very few things:

- Python
- Golang
- Node
- HTML
- CSS
- JavaScript
- TypeScript
- Vue
- Json
- SQL
- Markdown

## key bindings

99% of the key bindings are set in the [keybinds.lua](../lua/core/keybinds.lua) file, you can centrally manage each plugin key.

### Basic keys

The leader key is space, you can change it yourself.

I use the system clipboard to copy and paste everything, so you need to download [xsel](https://github.com/kfish/xsel).

This is easy on Arch, you just need to enter the following command:

```
$ yay -S xsel
```

Here are the basic keys:

| Models | Keys             | Instructions                                |
| ------ | ---------------- | ------------------------------------------- |
| n      | \\\\             | close neovim                                |
| n      | &lt;esc&gt;      | Turn off search heights                     |
| n      | H                | to the beginning of this line of characters |
| n      | L                | to the end of this line of characters       |
| n      | &lt;a-k&gt;      | Increase split screen height (horizontal)   |
| n      | &lt;a-j&gt;      | Reduce split screen height (horizontal)     |
| n      | &lt;a-h&gt;      | Increase split screen width (vertical)      |
| n      | &lt;a-l&gt;      | Reduce split screen width (vertical)        |
| n      | &lt;leader&gt;cs | Toggle Spell Check                          |
| n      | &lt;c-u&gt;      | Move up 10 lines                            |
| n      | &lt;c-d&gt;      | Move down 10 lines                          |
| v      | H                | to the beginning of this line of characters |
| v      | L                | to the end of the line                      |
| i      | jj               | exit insert mode                            |
| i      | &lt;a-k&gt;      | cursor moves up                             |
| i      | &lt;a-j&gt;      | cursor moves down                           |
| i      | &lt;a-h&gt;      | Cursor moves left                           |
| i      | &lt;a-l&gt;      | cursor moves right                          |
| t      | &lt;esc&gt;      | exit insert mode for term                   |

### Function keys

There are now 5 function keys provided by the following plugins:

| Models | Keys            | Instructions         | Plugins                                                          |
| ------ | --------------- | -------------------- | ---------------------------------------------------------------- |
| n      | &lt;leader&gt;1 | switch file tree     | [neovim-tree](https://github.com/kyazdani42/nvim-tree.lua)       |
| n      | &lt;leader&gt;2 | Toggle outline tree  | [aerial](https://github.com/stevearc/aerial.nvim)                |
| n      | &lt;leader&gt;3 | switch undo tree     | [undotree](https://github.com/mbbill/undotree)                   |
| n      | &lt;leader&gt;4 | switch DB tree       | [vim-dadbod-ui](https://github.com/kristijanhusak/vim-dadbod-ui) |
| n      | &lt;leader&gt;5 | Turn on drawing mode | [venn](https://github.com/jbyuki/venn.nvim)                      |

![](https://images-1302522496.cos.ap-nanjing.myqcloud.com/img/202203102319458.gif)

Press &lt;leader&gt;2 to view the outline:

![](https://images-1302522496.cos.ap-nanjing.myqcloud.com/img/202203102320738.gif)

Press &lt;leader&gt;3 to view the undo, even if you quit neovim, you can still undo or redo the next time you open the file:

![](https://images-1302522496.cos.ap-nanjing.myqcloud.com/img/202203102322474.gif)

Press &lt;leader&gt;4 to view the DB, you can configure the link DB, which is in the [options.lua](../lua/core/options.lua) file:

![](https://images-1302522496.cos.ap-nanjing.myqcloud.com/img/202203102325558.gif)

Press &lt;leader&gt;5 to start drawing mode, please refer to the following chapters for drawing mode:

![](https://images-1302522496.cos.ap-nanjing.myqcloud.com/img/202203191542040.gif)

### buffer

[bufferline](https://github.com/akinsho/bufferline.nvim) provides buffer operations, the following are the keys I set:

| Modes | Keys             | Instructions                     | Plugins                                                  |
| ----- | ---------------- | -------------------------------- | -------------------------------------------------------- |
| n     | &lt;c-h&gt;      | jump to left buffer              | [bufferline](https://github.com/akinsho/bufferline.nvim) |
| n     | &lt;c-l&gt;      | jump to the right buffer         | [bufferline](https://github.com/akinsho/bufferline.nvim) |
| n     | &lt;c-q&gt;      | close the current buffer         | [bufdelete](https://github.com/famiu/bufdelete.nvim)     |
| n     | &lt;leader&gt;bh | close left buffer                | [bufferline](https://github.com/akinsho/bufferline.nvim) |
| n     | &lt;leader&gt;bl | close the right buffer           | [bufferline](https://github.com/akinsho/bufferline.nvim) |
| n     | &lt;leader&gt;bo | Close the left and right buffers | [bufferline](https://github.com/akinsho/bufferline.nvim) |
| n     | &lt;leader&gt;b1 | jump to buffer 1                 | [bufferline](https://github.com/akinsho/bufferline.nvim) |
| n     | &lt;leader&gt;b2 | jump to buffer 2                 | [bufferline](https://github.com/akinsho/bufferline.nvim) |
| n     | &lt;leader&gt;b3 | jump to buffer 3                 | [bufferline](https://github.com/akinsho/bufferline.nvim) |
| n     | &lt;leader&gt;b4 | jump to buffer 4                 | [bufferline](https://github.com/akinsho/bufferline.nvim) |
| n     | &lt;leader&gt;b5 | jump to buffer 5                 | [bufferline](https://github.com/akinsho/bufferline.nvim) |
| n     | &lt;leader&gt;b6 | jump to buffer 6                 | [bufferline](https://github.com/akinsho/bufferline.nvim) |
| n     | &lt;leader&gt;b7 | jump to buffer 7                 | [bufferline](https://github.com/akinsho/bufferline.nvim) |
| n     | &lt;leader&gt;b8 | jump to buffer 8                 | [bufferline](https://github.com/akinsho/bufferline.nvim) |
| n     | &lt;leader&gt;b9 | jump to buffer 9                 | [bufferline](https://github.com/akinsho/bufferline.nvim) |
| n     | &lt;leader&gt;bt | jump to buffer n                 | [bufferline](https://github.com/akinsho/bufferline.nvim) |

![](https://images-1302522496.cos.ap-nanjing.myqcloud.com/img/202203111446713.gif)

### Quick Jump

[hop](https://github.com/phaazon/hop.nvim) can quickly jump to a word, character, or line.

| Models | Keys             | Instructions     | Plugins                                    |
| ------ | ---------------- | ---------------- | ------------------------------------------ |
| n      | &lt;leader&gt;hc | jump to a word   | [hop](https://github.com/phaazon/hop.nvim) |
| n      | &lt;leader&gt;hw | jump to a single | [hop](https://github.com/phaazon/hop.nvim) |
| n      | &lt;leader&gt;hl | jump to a line   | [hop](https://github.com/phaazon/hop.nvim) |

![](https://images-1302522496.cos.ap-nanjing.myqcloud.com/img/202203121545394.gif)

### lsp operations

[lsp-config](https://github.com/neovim/nvim-lspconfig) with [nvim-lsp-installer](https://github.com/williamboman/nvim-lsp-installer) plugin to install LSP service made simple.

I use a lot of plugins to make LSP as easy to use as possible, here are some key settings via [telescope](https://github.com/nvim-telescope/telescope.nvim) and [lspsaga](https ://github.com/tami5/lspsaga.nvim), all functions have become beautiful and easy to use:

| Models | Keys             | Instructions                   | Plugins                                                       |
| ------ | ---------------- | ------------------------------ | ------------------------------------------------------------- |
| n      | gd               | jump to definition             | [telescope](https://github.com/nvim-telescope/telescope.nvim) |
| n      | gr               | View all references            | [telescope](https://github.com/nvim-telescope/telescope.nvim) |
| n      | go               | Workspace Diagnostics          | [telescope](https://github.com/nvim-telescope/telescope.nvim) |
| n      | gh               | Get help information           | [lspsaga](https://github.com/tami5/lspsaga.nvim)              |
| n      | g[               | Jump to previous code question | [lspsaga](https://github.com/tami5/lspsaga.nvim)              |
| n      | g]               | Jump to next code question     | [lspsaga](https://github.com/tami5/lspsaga.nvim)              |
| n      | &lt;c-b&gt;      | page up                        | [lspsaga](https://github.com/tami5/lspsaga.nvim)              |
| n      | &lt;c-f&gt;      | page down                      | [lspsaga](https://github.com/tami5/lspsaga.nvim)              |
| n      | &lt;leader&gt;cn | variable renaming              | [lspsaga](https://github.com/tami5/lspsaga.nvim)              |
| n      | &lt;leader&gt;ca | Trigger code behavior          | [lspsaga](https://github.com/tami5/lspsaga.nvim)              |
| i      | &lt;c-j&gt;      | View function signature        | [lsp_signature](https://github.com/ray-x/lsp_signature.nvim)  |

![](https://images-1302522496.cos.ap-nanjing.myqcloud.com/img/202203121606504.gif)

### Code Completion

[nvim-cmp](https://github.com/hrsh7th/nvim-cmp) and [copilot](https://github.com/github/copilot.vim) provide a powerful code completion system that enables It's easier for you to write code.

I have built a lot of [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) completion sources, one of which is [tabnine](https://github.com/tzachar/cmp-tabnine), you may encounter problems when using it for the first time, just enter the following command in the shell to solve this problem:

```
$ ~/.local/share/nvim/site/pack/packer/opt/cmp-tabnine/install.sh
```

The key settings are as follows:

| Models | Keys        | Instructions                                                                                                                                                        | Plugins                                          |
| ------ | ----------- | ------------------------------------------------------------------------------------------------------------------------------------------------------------------- | ------------------------------------------------ |
| i      | &lt;c-k&gt; | Show or hide the completion menu                                                                                                                                    | [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)  |
| i      | &lt;c-p&gt; | select previous suggestion                                                                                                                                          | [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)  |
| i      | &lt;c-n&gt; | select next suggestion                                                                                                                                              | [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)  |
| i      | &lt;cr&gt;  | Select current suggestion                                                                                                                                           | [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)  |
| i      | &lt;tab&gt; | When a completion suggestion is not selected, select the first completion suggestion, when a completion suggestion has been selected, select the current suggestion | [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)  |
| i      | &lt;c-l&gt; | Select the current proposal for copilot                                                                                                                             | [copilot](https://github.com/github/copilot.vim) |
| i      | &lt;a-[&gt; | Select the previous suggestion for copilot                                                                                                                          | [copilot](https://github.com/github/copilot.vim) |
| i      | &lt;a-]&gt; | Select the next suggestion from copilot                                                                                                                             | [copilot](https://github.com/github/copilot.vim) |
| i      | &lt;c-[&gt; | Suggestions for turning off copilot                                                                                                                                 | [copilot](https://github.com/github/copilot.vim) |

![](https://images-1302522496.cos.ap-nanjing.myqcloud.com/img/202203121615483.gif)

### Refactoring

[nvim_spectre](https://github.com/nvim-pack/nvim-spectre) is useful for code refactoring, it can match a certain piece of text and replace it with another piece of text based on regular expressions. But it needs the support of [sed](https://www.gnu.org/software/sed/) and [ripgrep](https://github.com/BurntSushi/ripgrep).

```
$ yay -S sed
$ yay -S ripgrep
```

| Models | Keys             | Instructions                                        | Plugins                                                   |
| ------ | ---------------- | --------------------------------------------------- | --------------------------------------------------------- |
| n      | &lt;leader&gt;rp | Search the entire project                           | [nvim_spectre](https://github.com/nvim-pack/nvim-spectre) |
| n      | &lt;leader&gt;rf | Search the current file                             | [nvim_spectre](https://github.com/nvim-pack/nvim-spectre) |
| n      | &lt;leader&gt;rw | Search for word under cursor (in the whole project) | [nvim_spectre](https://github.com/nvim-pack/nvim-spectre) |
| n      | dd               | select or deselect the current line                 | [nvim_spectre](https://github.com/nvim-pack/nvim-spectre) |
| n      | &lt;cr&gt;       | Jump to the file under the cursor                   | [nvim_spectre](https://github.com/nvim-pack/nvim-spectre) |
| n      | &lt;leader&gt;o  | Open settings options                               | [nvim_spectre](https://github.com/nvim-pack/nvim-spectre) |
| n      | &lt;leader&gt;r  | make a replacement                                  | [nvim_spectre](https://github.com/nvim-pack/nvim-spectre) |
| n      | &lt;leader&gt;v  | View the difference comparison                      | [nvim_spectre](https://github.com/nvim-pack/nvim-spectre) |

![](https://images-1302522496.cos.ap-nanjing.myqcloud.com/img/202203121552532.gif)

### Code comments

Thanks to [Comment](https://github.com/numToStr/Comment.nvim) plugin and [nvim-ts-context-commentstring](https://github.com/JoosepAlviste/nvim-ts-context-commentstring) plugin, which allows us to write code comments very conveniently.

| Models | Keys | Instructions                                                      | Plugins                                             |
| ------ | ---- | ----------------------------------------------------------------- | --------------------------------------------------- |
| n      | gcc  | Comment out the current line (line mode)                          | [Comment](https://github.com/numToStr/Comment.nvim) |
| n      | gCC  | Comment out the current line (block mode)                         | [Comment](https://github.com/numToStr/Comment.nvim) |
| v      | gc   | Comment out the selected line (line mode)                         | [Comment](https://github.com/numToStr/Comment.nvim) |
| v      | gC   | Comment out the selected line (block mode)                        | [Comment](https://github.com/numToStr/Comment.nvim) |
| n      | gc0  | Insert a comment at the beginning of the current line (line mode) | [Comment](https://github.com/numToStr/Comment.nvim) |
| n      | gco  | Insert a comment at the beginning of a new line (line mode)       | [Comment](https://github.com/numToStr/Comment.nvim) |
| n      | gcA  | Insert a comment at the end of the current line (line mode)       | [Comment](https://github.com/numToStr/Comment.nvim) |

![](https://images-1302522496.cos.ap-nanjing.myqcloud.com/img/202203121618431.gif)

### Code formatting

The [neoformat](https://github.com/sbdchd/neoformat) plugin can format code, but you need to download formatters for various languages.

- [language formatter download](https://github.com/sbdchd/neoformat#supported-filetypes)

You can directly copy the following content and paste the formatter for each language preset by the configuration item:

```
$ npm install -g lua-fmt
$ npm install -g prettier
$ npm install -g gofmt
$ pip3 install autopep8
$ pip3 install sqlformat
```

The formatted key is &lt;leader&gt;cf.

![](https://images-1302522496.cos.ap-nanjing.myqcloud.com/img/202203121625188.gif)

### Code debugging

[nvim-dap](https://github.com/mfussenegger/nvim-dap), [nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui), [nvim-dap -virtual-text](https://github.com/theHamsta/nvim-dap-virtual-text) The combination of three Plugins can make us happy to debug the code.

| Models | Keys             | Instructions                              | Plugins                                                |
| ------ | ---------------- | ----------------------------------------- | ------------------------------------------------------ |
| n      | &lt;leader&gt;db | mark breakpoint                           | [nvim-dap](https://github.com/mfussenegger/nvim-dap)   |
| n      | &lt;leader&gt;du | Close the debug interface                 | [nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui) |
| n      | &lt;f5&gt;       | Turn on debugging or go to the next point | [nvim-dap](https://github.com/mfussenegger/nvim-dap)   |
| n      | &lt;f6&gt;       | step into                                 | [nvim-dap](https://github.com/mfussenegger/nvim-dap)   |
| n      | &lt;f7&gt;       | step over                                 | [nvim-dap](https://github.com/mfussenegger/nvim-dap)   |
| n      | &lt;f8&gt;       | step out of the current function          | [nvim-dap](https://github.com/mfussenegger/nvim-dap)   |
| n      | &lt;f9&gt;       | restart debugging                         | [nvim-dap](https://github.com/mfussenegger/nvim-dap)   |
| n      | &lt;f10&gt;      | close the debugger                        | [nvim-dap](https://github.com/mfussenegger/nvim-dap)   |

![](https://images-1302522496.cos.ap-nanjing.myqcloud.com/img/202203121621633.gif)

### Code screenshot

The [vim_carbon_now_sh](https://github.com/kristijanhusak/vim-carbon-now-sh) plugin allows us to generate code images in jpg format.

| Models | Keys             | Instructions      | Plugins                                                                 |
| ------ | ---------------- | ----------------- | ----------------------------------------------------------------------- |
| n      | &lt;leader&gt;ch | Generate code map | [vim_carbon_now_sh](https://github.com/kristijanhusak/vim-carbon-now-sh |
| v      | &lt;leader&gt;ch | Generate code map | [vim_carbon_now_sh](https://github.com/kristijanhusak/vim-carbon-now-sh |

![image-20220312161955667](https://images-1302522496.cos.ap-nanjing.myqcloud.com/img/202203121619966.png)

### Built-in terminal

[toggleterm](https://github.com/akinsho/toggleterm.nvim) Enhanced neovim built-in terminal experience.

In addition, I customized a floating terminal and a [lazygit](https://github.com/jesseduffield/lazygit) terminal, using [lazygit](https://github.com/jesseduffield/lazygit) to manage Repositories are a very smart choice, and I recommend you learn about them.

| Models | Keys             | Instructions               | Plugins                                                  |
| ------ | ---------------- | -------------------------- | -------------------------------------------------------- |
| n      | &lt;leader&gt;tt | open bottom terminal       | [toggleterm](https://github.com/akinsho/toggleterm.nvim) |
| n      | &lt;leader&gt;tf | Open floating terminal     | [toggleterm](https://github.com/akinsho/toggleterm.nvim) |
| n      | &lt;leader&gt;tg | Open lazygit terminal      | [toggleterm](https://github.com/akinsho/toggleterm.nvim) |
| n      | &lt;leader&gt;ta | close all bottom terminals | [toggleterm](https://github.com/akinsho/toggleterm.nvim) |

In addition, the floating terminal and lazygit terminal enter insert mode by default, the floating terminal press &lt;esc&gt; to exit, and the lazygit terminal press q to exit.

![](https://images-1302522496.cos.ap-nanjing.myqcloud.com/img/202203121622011.gif)

### Find related

The &lt;leader&gt;f prefixes are all lookup related.

[telescope](https://github.com/nvim-telescope/telescope.nvim) is able to fuzzy lookup some files.

It has some external dependencies, you need to download and install [fd](https://github.com/sharkdp/fd) and ripgrep(https://github.com/BurntSushi/ripgrep):

Take Arch as an example:

```
$ yay -S fd
$ yay -S repgrep
```

| Models | Keys             | Instructions                                | Plugins                                                       |
| ------ | ---------------- | ------------------------------------------- | ------------------------------------------------------------- |
| n      | &lt;leader&gt;ff | Fuzzy find files                            | [telescope](https://github.com/nvim-telescope/telescope.nvim) |
| n      | &lt;leader&gt;fg | Fuzzy find text                             | [telescope](https://github.com/nvim-telescope/telescope.nvim) |
| n      | &lt;leader&gt;fo | recently opened files                       | [telescope](https://github.com/nvim-telescope/telescope.nvim) |
| n      | &lt;leader&gt;fh | recent search results                       | [telescope](https://github.com/nvim-telescope/telescope.nvim) |
| n      | &lt;leader&gt;fm | Find the nearest tag                        | [telescope](https://github.com/nvim-telescope/telescope.nvim) |
| n      | &lt;leader&gt;ft | Open the current file in the directory tree | [nvim-tree](https://github.com/kyazdani42/nvim-tree.lua)      |
| n      | &lt;leader&gt;fn | Find recent message records                 | [nvim-notify](https://github.com/rcarriga/nvim-notify)        |
| n      | &lt;leader&gt;fc | Open the current file in the directory tree | [nvim-tree](https://github.com/kyazdani42/nvim-tree.lua)      |

![](https://images-1302522496.cos.ap-nanjing.myqcloud.com/img/202203121556021.gif)

### Text translation

[translator](https://github.com/uga-rosa/translate.nvim) can translate various languages. Its maintainers are also great.

You need to download and install [translate-shell](https://github.com/soimort/translate-shell) or register a [deepl](https://www.deepl.com/en/docs-api/) account to get the translation results.

If you are using [deepl](https://www.deepl.com/en/docs-api/) then additionally install [curl](https://curl.se/) and [jq](https ://github.com/stedolan/jq).

The following is the key binding I set, translated from English to Chinese or Chinese to English, you can replace it in the [keybinds](../lua/core/keybinds.lua) file:

| Models | Keys              | Instructions                                                  | Plugins                                                  |
| ------ | ----------------- | ------------------------------------------------------------- | -------------------------------------------------------- |
| n      | &lt;leader&gt;tcs | Translate English to Chinese (split)                          | [translator](https://github.com/uga-rosa/translate.nvim) |
| n      | &lt;leader&gt;tcr | Replace English with Chinese                                  | [translator](https://github.com/uga-rosa/translate.nvim) |
| n      | &lt;leader&gt;tcf | Translate English to Chinese (float)                          | [translator](https://github.com/uga-rosa/translate.nvim) |
| n      | &lt;leader&gt;tci | Insert the English translation result below the original text | [translator](https://github.com/uga-rosa/translate.nvim) |
| n      | &lt;leader&gt;tes | Translate Chinese to English (split)                          | [translator](https://github.com/uga-rosa/translate.nvim) |
| n      | &lt;leader&gt;ter | Replace Chinese with English                                  | [translator](https://github.com/uga-rosa/translate.nvim) |
| n      | &lt;leader&gt;tef | Translate Chinese to English (float)                          | [translator](https://github.com/uga-rosa/translate.nvim) |
| n      | &lt;leader&gt;tei | Insert the Chinese translation result below the original text | [translator](https://github.com/uga-rosa/translate.nvim) |
| x      | &lt;leader&gt;tcs | Translate English to Chinese (split)                          | [translator](https://github.com/uga-rosa/translate.nvim) |
| x      | &lt;leader&gt;tcr | Replace English with Chinese                                  | [translator](https://github.com/uga-rosa/translate.nvim) |
| x      | &lt;leader&gt;tcf | Translate English to Chinese (float)                          | [translator](https://github.com/uga-rosa/translate.nvim) |
| x      | &lt;leader&gt;tci | Insert the English translation result below the original text | [translator](https://github.com/uga-rosa/translate.nvim) |
| x      | &lt;leader&gt;tes | Translate Chinese to English (split)                          | [translator](https://github.com/uga-rosa/translate.nvim) |
| x      | &lt;leader&gt;ter | Replace Chinese with English                                  | [translator](https://github.com/uga-rosa/translate.nvim) |
| x      | &lt;leader&gt;tef | Translate Chinese to English (float)                          | [translator](https://github.com/uga-rosa/translate.nvim) |
| x      | &lt;leader&gt;tei | Insert the Chinese translation result below the original text | [translator](https://github.com/uga-rosa/translate.nvim) |

![](https://images-1302522496.cos.ap-nanjing.myqcloud.com/img/202203121559836.gif)

### Multi-cursor operation

The [vim-visual-multi](https://github.com/mg979/vim-visual-multi) plugin provides multi-cursor operations for neovim.

| Models | Keys        | Instructions             | Plugins                                                       |
| ------ | ----------- | ------------------------ | ------------------------------------------------------------- |
| n      | &lt;c-n&gt; | select next word         | [vim-visual-multi](https://github.com/mg979/vim-visual-multi) |
| n      | &lt;c-p&gt; | Cancel current selection | [vim-visual-multi](https://github.com/mg979/vim-visual-multi) |
| n      | &lt;c-s&gt; | Skip current selection   | [vim-visual-multi](https://github.com/mg979/vim-visual-multi) |
| n      | &lt;esc&gt; | Exit multi-cursor mode   | [vim-visual-multi](https://github.com/mg979/vim-visual-multi) |
| n      | &lt;tab&gt; | Toggle multi-cursor mode | [vim-visual-multi](https://github.com/mg979/vim-visual-multi) |

![](https://images-1302522496.cos.ap-nanjing.myqcloud.com/img/202203181649057.gif)

### Range selection

The [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) plugin has a built-in range selection function. Before using this plugin, you need to install [gcc](https://gcc .gnu.org/).

Here are the keys I bind to it:

| Models | Keys        | Instructions                 | Plugins                                                               |
| ------ | ----------- | ---------------------------- | --------------------------------------------------------------------- |
| n      | &lt;cr&gt;  | Start range selection        | [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) |
| n      | &lt;cr&gt;  | Expand your range of options | [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) |
| n      | &lt;bs&gt;  | Narrow selection             | [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) |
| n      | &lt;tab&gt; | Select all the entire range  | [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) |

![](https://images-1302522496.cos.ap-nanjing.myqcloud.com/img/202203121624365.gif)

### Drawing mode

[venn](https://github.com/jbyuki/venn.nvim) allows us to draw in neovim.

Here are the keybindings I set up:

| 模式 | 键位        | 说明                     | 插件                                        |
| ---- | ----------- | ------------------------ | ------------------------------------------- |
| n    | &lt;c-k&gt; | draw line up             | [venn](https://github.com/jbyuki/venn.nvim) |
| n    | &lt;c-j&gt; | draw line down           | [venn](https://github.com/jbyuki/venn.nvim) |
| n    | &lt;c-h&gt; | draw line to the left    | [venn](https://github.com/jbyuki/venn.nvim) |
| n    | &lt;c-l&gt; | Draw a line to the right | [venn](https://github.com/jbyuki/venn.nvim) |
| v    | b           | draw box                 | [venn](https://github.com/jbyuki/venn.nvim) |
| v    | f           | fill area                | [venn](https://github.com/jbyuki/venn.nvim) |

![](https://images-1302522496.cos.ap-nanjing.myqcloud.com/img/202203191542040.gif)

### Other keys

The [switch](https://github.com/AndrewRadev/switch.vim) plugin can quickly change true to false, or false to true.

Its key binding is gs, if you want to add a custom word, you can add it in the [switch plugin configuration file](../lua/configure/plugins/switch.lua) file.

![](https://images-1302522496.cos.ap-nanjing.myqcloud.com/img/202203121626121.gif)

The [surround](https://github.com/ur4ltz/surround.nvim) plugin can quickly replace packages, such as replacing [] with () and "" with ''.

Here are some of its default key bindings:

```
ds[char]        delete package
cs[char][char]  Modify the package
ys[scope][char] add package
```

![](https://images-1302522496.cos.ap-nanjing.myqcloud.com/img/202203121627730.gif)

## some commands

### View lsp service

Here are some commands for the LSP service:

```
LSPInfo : View LSP running status
LSPInstallInfo : View LSP download status
```

### View error message

Some exceptions or warnings can be viewed through &lt;leader&gt;fn or :message.

### Preview markdown

If you want to preview markdown files, you need to download pandoc and live-server:

```
$ yay -S pandoc
$ npm install -g live-server
```

Then enter the :MarkdownPreview command.

### Define code snippet

If you need a custom code snippet, enter the :VsnipOpen command.

## common problem

### Icon display error

You need to install [nerd font](https://link.zhihu.com/?targetu003dhttps%3A//www.nerdfonts.com/), and set the terminal font to the font of Nerd font.

### How to install new plugins

I made some simplifications to the configuration of [packer](https://github.com/wbthomason/packer.nvim).

Before this, when you need to write the configuration file as follows:

```
{
    "xxx",
    config = require("configure/plugins/xxx.lua")
}
```

But after this you can configure it more simply:

```
{
    "xxx",
    load_file = true,
}
```

### How to configure a new LSP

please check:

- https://github.com/williamboman/nvim-lsp-installer#available-lsps
- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

The LSP configuration is placed in the lua/configure/lsp/ directory.

To be able to install all the LSPs built into the project, you need to have nodeJS and npm installed.

Use :LSPInstallInfo to check the download status.

### How to configure a new DAP

please check:

- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation

I have debuggers for Python and Golang configured by default, but you need to install them:

```
$ pacman -S delve
$ python3 -m pip install debugpy
```

### How to configure a new lint

please check:

- https://github.com/mfussenegger/nvim-lint

### Why doesn't my Python have LSP diagnostics

I use pylint for diagnostics instead of pyright, you can download a pylint:

```
$ pip3 install pylint
```
