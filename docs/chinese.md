# 说明文档

## 说明

这是一份我自己使用的 neovim 配置项目，全部由 Lua 语言编写，内置了许多非常实用的插件。

它的启动速度非常快，因为我对 90% 的插件都做了 lazy load：

<img src="https://images-1302522496.cos.ap-nanjing.myqcloud.com/img/202203102201493.png"  />

我会不断更新这里的配置，让它变得越来越人性化。

## 目录

目录列表：

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
│   │   ├── after
│   │   │   ├── filetype_load_snippet.lua
│   │   │   ├── init.lua
│   │   │   └── input_toggle.lua
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
└── snippets
    └── ...
```

一级目录说明：

- docs：存放该项目不同语言的 README 文档
- ftplugin：存放不同文件类型的缩进规则文件
- lint：存放不同语言的 lint 配置文件
- lua：主目录程序
- resource：存放各种外部资源文件，如 alacritty 的配置文件

二级目录说明：

- lua/configure：存放插件、LSP、DAP 等配置文件
- lua/core：存放核心配置文件
- lua/tools：一些外部命令库

三级目录说明：

- dap：存放各种语言 DAP 配置
- lsp：存放各种语言 LSP 配置
- plugins：存放各种插件配置
- lua/core/after：存放所有配置加载完成后运行的脚本命令，如输入法切换与框架代码片段加载

文件说明：

- lua/core/keybinds.lua：存放所有插件、个人配置的快捷键位配置
- lua/core/options.lua：存放一些全局的个人、插件等配置
- lua/core/settings.lua：存放所有 neovim 内置的配置选项
- lua/core/plugins.lua：存放所有该项目所依赖的第三方插件

## 依赖

基本依赖：

- [neovim > 0.5](https://link.zhihu.com/?target=https%3A//github.com/neovim/neovim/releases/latest)
- [gcc](https://gcc.gnu.org/)
- [nerd font](https://link.zhihu.com/?target=https%3A//www.nerdfonts.com/)
- [fd](https://link.zhihu.com/?target=https%3A//github.com/sharkdp/fd)
- [ripgrep](https://github.com/BurntSushi/ripgrep)
- [translate-shell](https://github.com/soimort/translate-shell)

其他依赖：

- tar curl git gzip wget
- node npm
- xsel

## 语言

现在，它支持以下语言，你只需要做很少的事情就能够利用这些语言愉快的编写程序：

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

## 键位绑定

99% 的按键绑定都被设置在了 [keybinds.lua](../lua/core/keybinds.lua) 文件中，你可以集中管理每一个插件键位。

### 基础的键位

leader 键是 space，你可以自行更改。

我使用系统剪切板来复制粘贴所有内容，因此你需要下载 [xsel](https://github.com/kfish/xsel)。

这在 Arch 上很容易，你只需要输入以下命令：

```
$ yay -S xsel
```

下面是基础键位：

| 模式 | 键位             | 说明                 |
| ---- | ---------------- | -------------------- |
| n    | \\\\             | 关闭 neovim          |
| n    | &lt;esc&gt;      | 关闭搜索高亮         |
| n    | H                | 到本行字符开始处     |
| n    | L                | 到本行字符结尾处     |
| n    | &lt;m-k&gt;      | 增加分屏高度（水平） |
| n    | &lt;m-j&gt;      | 缩小分屏高度（水平） |
| n    | &lt;m-h&gt;      | 增加分屏宽度（垂直） |
| n    | &lt;m-l&gt;      | 缩小分屏宽度（垂直） |
| n    | &lt;leader&gt;cs | 切换拼写检查         |
| n    | &lt;c-u&gt;      | 向上移动 10 行       |
| n    | &lt;c-d&gt;      | 向下移动 10 行       |
| v    | H                | 到本行字符开始处     |
| v    | L                | 到本行结尾处         |
| i    | jj               | 退出插入模式         |
| i    | &lt;m-k&gt;      | 光标向上移动         |
| i    | &lt;m-j&gt;      | 光标向下移动         |
| i    | &lt;m-h&gt;      | 光标向左移动         |
| i    | &lt;m-l&gt;      | 光标向右移动         |
| c    | &lt;m-k&gt;      | 上一条历史记录       |
| c    | &lt;m-j&gt;      | 下一条历史记录       |
| c    | &lt;m-h&gt;      | 向左移动光标         |
| c    | &lt;m-l&gt;      | 向右移动光标         |
| t    | &lt;esc&gt;      | 退出 term 的插入模式 |

### 功能类键位

现在有 5 个功能类键位，分别由以下插件提供：

| 模式 | 键位            | 说明         | 插件                                                             |
| ---- | --------------- | ------------ | ---------------------------------------------------------------- |
| n    | &lt;leader&gt;1 | 切换文件树   | [neovim-tree](https://github.com/kyazdani42/nvim-tree.lua)       |
| n    | &lt;leader&gt;2 | 切换大纲树   | [aerial](https://github.com/stevearc/aerial.nvim)                |
| n    | &lt;leader&gt;3 | 切换撤销树   | [undotree](https://github.com/mbbill/undotree)                   |
| n    | &lt;leader&gt;4 | 切换 DB 树   | [vim-dadbod-ui](https://github.com/kristijanhusak/vim-dadbod-ui) |
| n    | &lt;leader&gt;5 | 开启绘图模式 | [venn](https://github.com/jbyuki/venn.nvim)                      |

按下 &lt;leader&gt;1 查看目录：

![](https://images-1302522496.cos.ap-nanjing.myqcloud.com/img/202203102319458.gif)

按下 &lt;leader&gt;2 查看大纲：

![](https://images-1302522496.cos.ap-nanjing.myqcloud.com/img/202203102320738.gif)

按下 &lt;leader&gt;3 查看撤销，即使你退出了 neovim，下次打开该文件时依旧可以 undo 或者 redo：

![](https://images-1302522496.cos.ap-nanjing.myqcloud.com/img/202203102322474.gif)

按下 &lt;leader&gt;4 查看 DB，你可以配置链接 DB，它在 [options.lua](../lua/core/options.lua) 文件中：

![](https://images-1302522496.cos.ap-nanjing.myqcloud.com/img/202203102325558.gif)

按下 &lt;leader&gt;5 开启绘图模式，绘图模式使用请参加下面的章节：

![](https://images-1302522496.cos.ap-nanjing.myqcloud.com/img/202203191542040.gif)

### 缓冲区

[bufferline](https://github.com/akinsho/bufferline.nvim) 提供了缓冲区操作，下面是我设置的键位：

| 模式 | 键位             | 说明               | 插件                                                     |
| ---- | ---------------- | ------------------ | -------------------------------------------------------- |
| n    | &lt;c-h&gt;      | 跳转到左侧缓冲区   | [bufferline](https://github.com/akinsho/bufferline.nvim) |
| n    | &lt;c-l&gt;      | 跳转到右侧缓冲区   | [bufferline](https://github.com/akinsho/bufferline.nvim) |
| n    | &lt;c-q&gt;      | 关闭当前缓冲区     | [bufdelete](https://github.com/famiu/bufdelete.nvim)     |
| n    | &lt;leader&gt;bh | 关闭左侧缓冲区     | [bufferline](https://github.com/akinsho/bufferline.nvim) |
| n    | &lt;leader&gt;bl | 关闭右侧缓冲区     | [bufferline](https://github.com/akinsho/bufferline.nvim) |
| n    | &lt;leader&gt;bo | 关闭左右两侧缓冲区 | [bufferline](https://github.com/akinsho/bufferline.nvim) |
| n    | &lt;leader&gt;b1 | 跳转到缓冲区 1     | [bufferline](https://github.com/akinsho/bufferline.nvim) |
| n    | &lt;leader&gt;b2 | 跳转到缓冲区 2     | [bufferline](https://github.com/akinsho/bufferline.nvim) |
| n    | &lt;leader&gt;b3 | 跳转到缓冲区 3     | [bufferline](https://github.com/akinsho/bufferline.nvim) |
| n    | &lt;leader&gt;b4 | 跳转到缓冲区 4     | [bufferline](https://github.com/akinsho/bufferline.nvim) |
| n    | &lt;leader&gt;b5 | 跳转到缓冲区 5     | [bufferline](https://github.com/akinsho/bufferline.nvim) |
| n    | &lt;leader&gt;b6 | 跳转到缓冲区 6     | [bufferline](https://github.com/akinsho/bufferline.nvim) |
| n    | &lt;leader&gt;b7 | 跳转到缓冲区 7     | [bufferline](https://github.com/akinsho/bufferline.nvim) |
| n    | &lt;leader&gt;b8 | 跳转到缓冲区 8     | [bufferline](https://github.com/akinsho/bufferline.nvim) |
| n    | &lt;leader&gt;b9 | 跳转到缓冲区 9     | [bufferline](https://github.com/akinsho/bufferline.nvim) |
| n    | &lt;leader&gt;bt | 跳转到缓冲区 n     | [bufferline](https://github.com/akinsho/bufferline.nvim) |

![](https://images-1302522496.cos.ap-nanjing.myqcloud.com/img/202203111446713.gif)

### 快速跳转

[hop](https://github.com/phaazon/hop.nvim) 可以快速的跳转到某一个单词、字符、或者行上。

| 模式 | 键位             | 说明           | 插件                                       |
| ---- | ---------------- | -------------- | ------------------------------------------ |
| n    | &lt;leader&gt;hc | 跳转到某个字符 | [hop](https://github.com/phaazon/hop.nvim) |
| n    | &lt;leader&gt;hw | 跳转到某个单词 | [hop](https://github.com/phaazon/hop.nvim) |
| n    | &lt;leader&gt;hl | 跳转到某一行上 | [hop](https://github.com/phaazon/hop.nvim) |

![](https://images-1302522496.cos.ap-nanjing.myqcloud.com/img/202203121545394.gif)

### lsp 操作

[lsp-config](https://github.com/neovim/nvim-lspconfig) 搭配 [nvim-lsp-installer](https://github.com/williamboman/nvim-lsp-installer) 插件让 LSP 服务安装变得简单。

我使用了很多插件来让 LSP 尽可能变得更加好用，下面是一些键位设置，通过 [telescope](https://github.com/nvim-telescope/telescope.nvim) 和 [lspsaga](https://github.com/tami5/lspsaga.nvim)，各项功能都变的美观且易用：

| 模式 | 键位             | 说明                 | 插件                                                          |
| ---- | ---------------- | -------------------- | ------------------------------------------------------------- |
| n    | gd               | 跳转到定义处         | [telescope](https://github.com/nvim-telescope/telescope.nvim) |
| n    | gr               | 查看所有引用         | [telescope](https://github.com/nvim-telescope/telescope.nvim) |
| n    | go               | 工作区诊断           | [telescope](https://github.com/nvim-telescope/telescope.nvim) |
| n    | gh               | 获得帮助信息         | [lspsaga](https://github.com/tami5/lspsaga.nvim)              |
| n    | [g               | 跳转到上一个代码问题 | [lspsaga](https://github.com/tami5/lspsaga.nvim)              |
| n    | ]g               | 跳转到下一个代码问题 | [lspsaga](https://github.com/tami5/lspsaga.nvim)              |
| n    | &lt;c-b&gt;      | 向上翻页             | [lspsaga](https://github.com/tami5/lspsaga.nvim)              |
| n    | &lt;c-f&gt;      | 向下翻页             | [lspsaga](https://github.com/tami5/lspsaga.nvim)              |
| n    | &lt;leader&gt;cn | 变量重命名           | [lspsaga](https://github.com/tami5/lspsaga.nvim)              |
| n    | &lt;leader&gt;ca | 触发代码行为         | [lspsaga](https://github.com/tami5/lspsaga.nvim)              |
| i    | &lt;c-j&gt;      | 查看函数签名         | [lsp_signature](https://github.com/ray-x/lsp_signature.nvim)  |

![](https://images-1302522496.cos.ap-nanjing.myqcloud.com/img/202203121606504.gif)

### 代码补全

[nvim-cmp](https://github.com/hrsh7th/nvim-cmp) 和 [copilot](https://github.com/github/copilot.vim) 提供了强大的代码补全系统，能够让你编写代码更加轻松。

我内置了非常多的 [nvim-cmp](https://github.com/hrsh7th/nvim-cmp) 补全源，其中有一个 [tabnine](https://github.com/tzachar/cmp-tabnine) 的补全源，初次使用它时你可能会遇见问题，只需要在 shell 中输入以下命令即可解决这个问题：

```
$ ~/.local/share/nvim/site/pack/packer/opt/cmp-tabnine/install.sh
```

键位设置如下：

| 模式 | 键位        | 说明                                                                       | 插件                                             |
| ---- | ----------- | -------------------------------------------------------------------------- | ------------------------------------------------ |
| i    | &lt;c-k&gt; | 显示或隐藏补全菜单                                                         | [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)  |
| i    | &lt;c-p&gt; | 选择上一个建议                                                             | [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)  |
| i    | &lt;c-n&gt; | 选择下一个建议                                                             | [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)  |
| i    | &lt;cr&gt;  | 选择当前建议                                                               | [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)  |
| i    | &lt;tab&gt; | 当未选择补全建议时，选择第一个补全建议，当已选择了补全建议时，选择当前建议 | [nvim-cmp](https://github.com/hrsh7th/nvim-cmp)  |
| i    | &lt;c-l&gt; | 选择 copilot 的当前建议                                                    | [copilot](https://github.com/github/copilot.vim) |
| i    | &lt;a-[&gt; | 选择 copilot 的上一个建议                                                  | [copilot](https://github.com/github/copilot.vim) |
| i    | &lt;a-]&gt; | 选择 copilot 的下一个建议                                                  | [copilot](https://github.com/github/copilot.vim) |
| i    | &lt;c-]&gt; | 关闭 copilot 的建议                                                        | [copilot](https://github.com/github/copilot.vim) |

注意，如果选择的建议是代码片段，可以通过 &lt;tab&gt; 和 &lt;s-tab&gt; 在 placeholder 中进行跳转。

![](https://images-1302522496.cos.ap-nanjing.myqcloud.com/img/202203121615483.gif)

### 代码重构

[nvim_spectre](https://github.com/nvim-pack/nvim-spectre) 在代码重构时很好用，它可以基于正则表达式来匹配某一段文本并将其替换为另一段文本。但是需要 [sed](https://www.gnu.org/software/sed/) 和 [ripgrep](https://github.com/BurntSushi/ripgrep) 的支持。

```
$ yay -S sed
$ yay -S ripgrep
```

| 模式 | 键位             | 说明                             | 插件                                                      |
| ---- | ---------------- | -------------------------------- | --------------------------------------------------------- |
| n    | &lt;leader&gt;rp | 搜索整个项目                     | [nvim_spectre](https://github.com/nvim-pack/nvim-spectre) |
| n    | &lt;leader&gt;rf | 搜索当前文件                     | [nvim_spectre](https://github.com/nvim-pack/nvim-spectre) |
| n    | &lt;leader&gt;rw | 搜索光标下的单词（在整个项目中） | [nvim_spectre](https://github.com/nvim-pack/nvim-spectre) |
| n    | dd               | 选中或取消当前行                 | [nvim_spectre](https://github.com/nvim-pack/nvim-spectre) |
| n    | &lt;cr&gt;       | 跳转到光标下的文件处             | [nvim_spectre](https://github.com/nvim-pack/nvim-spectre) |
| n    | &lt;leader&gt;o  | 打开设置选项                     | [nvim_spectre](https://github.com/nvim-pack/nvim-spectre) |
| n    | &lt;leader&gt;r  | 进行替换                         | [nvim_spectre](https://github.com/nvim-pack/nvim-spectre) |
| n    | &lt;leader&gt;v  | 查看差异对比                     | [nvim_spectre](https://github.com/nvim-pack/nvim-spectre) |

![](https://images-1302522496.cos.ap-nanjing.myqcloud.com/img/202203121552532.gif)

### 代码注释

得益于 [Comment](https://github.com/numToStr/Comment.nvim) 插件和 [nvim-ts-context-commentstring](https://github.com/JoosepAlviste/nvim-ts-context-commentstring) 插件，能让我们非常方便的书写代码注释。

| 模式 | 键位 | 说明                         | 插件                                                |
| ---- | ---- | ---------------------------- | --------------------------------------------------- |
| n    | gcc  | 注释当前行（行模式）         | [Comment](https://github.com/numToStr/Comment.nvim) |
| n    | gCC  | 注释当前行（块模式）         | [Comment](https://github.com/numToStr/Comment.nvim) |
| v    | gc   | 注释选中行（行模式）         | [Comment](https://github.com/numToStr/Comment.nvim) |
| v    | gC   | 注释选中行（块模式）         | [Comment](https://github.com/numToStr/Comment.nvim) |
| n    | gc0  | 在当前行首插入注释（行模式） | [Comment](https://github.com/numToStr/Comment.nvim) |
| n    | gco  | 在新行首插入注释（行模式）   | [Comment](https://github.com/numToStr/Comment.nvim) |
| n    | gcA  | 在当前行尾插入注释（行模式） | [Comment](https://github.com/numToStr/Comment.nvim) |

![](https://images-1302522496.cos.ap-nanjing.myqcloud.com/img/202203121618431.gif)

### 代码格式化

[neoformat](https://github.com/sbdchd/neoformat) 插件可以格式化代码，但你需要下载各种语言的格式化程序。

- [语言格式化程序下载](https://github.com/sbdchd/neoformat#supported-filetypes)

你可以直接复制以下内容粘贴该配置项目所预定设置的各种语言的格式化程序：

```
$ npm install -g lua-fmt
$ npm install -g prettier
$ npm install -g gofmt
$ pip3 install autopep8
$ pip3 install sqlformat
```

格式化的键位是 &lt;leader&gt;cf。

![](https://images-1302522496.cos.ap-nanjing.myqcloud.com/img/202203121625188.gif)

### 代码调试

[nvim-dap](https://github.com/mfussenegger/nvim-dap)、[nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui)、[nvim-dap-virtual-text](https://github.com/theHamsta/nvim-dap-virtual-text) 三个插件的搭配可以令我们愉快的调试代码。

| 模式 | 键位             | 说明                       | 插件                                                   |
| ---- | ---------------- | -------------------------- | ------------------------------------------------------ |
| n    | &lt;leader&gt;db | 标记断点                   | [nvim-dap](https://github.com/mfussenegger/nvim-dap)   |
| n    | &lt;leader&gt;du | 关闭调试界面               | [nvim-dap-ui](https://github.com/rcarriga/nvim-dap-ui) |
| n    | &lt;f5&gt;       | 开启调试或到下一个标记点处 | [nvim-dap](https://github.com/mfussenegger/nvim-dap)   |
| n    | &lt;f6&gt;       | 单步进入                   | [nvim-dap](https://github.com/mfussenegger/nvim-dap)   |
| n    | &lt;f7&gt;       | 单步跳过                   | [nvim-dap](https://github.com/mfussenegger/nvim-dap)   |
| n    | &lt;f8&gt;       | 步出当前函数               | [nvim-dap](https://github.com/mfussenegger/nvim-dap)   |
| n    | &lt;f9&gt;       | 重新启动调试               | [nvim-dap](https://github.com/mfussenegger/nvim-dap)   |
| n    | &lt;f10&gt;      | 关闭调试程序               | [nvim-dap](https://github.com/mfussenegger/nvim-dap)   |

![](https://images-1302522496.cos.ap-nanjing.myqcloud.com/img/202203121621633.gif)

### 代码截图

[vim_carbon_now_sh](https://github.com/kristijanhusak/vim-carbon-now-sh) 插件能让我们生成 jpg 格式的代码图片。

| 模式 | 键位             | 说明         | 插件                                                                     |
| ---- | ---------------- | ------------ | ------------------------------------------------------------------------ |
| n    | &lt;leader&gt;ch | 生成代码图片 | [vim_carbon_now_sh](https://github.com/kristijanhusak/vim-carbon-now-sh) |
| v    | &lt;leader&gt;ch | 生成代码图片 | [vim_carbon_now_sh](https://github.com/kristijanhusak/vim-carbon-now-sh) |

![image-20220312161955667](https://images-1302522496.cos.ap-nanjing.myqcloud.com/img/202203121619966.png)

### 内置终端

[toggleterm](https://github.com/akinsho/toggleterm.nvim) 加强了 neovim 内置终端的体验。

除此之外，我定制了一个浮动终端和一个 [lazygit](https://github.com/jesseduffield/lazygit) 终端， 使用 [lazygit](https://github.com/jesseduffield/lazygit) 来管理仓库是非常明智的选择，我推荐你学习一下它。

| 模式 | 键位             | 说明              | 插件                                                     |
| ---- | ---------------- | ----------------- | -------------------------------------------------------- |
| n    | &lt;leader&gt;tt | 打开底部终端      | [toggleterm](https://github.com/akinsho/toggleterm.nvim) |
| n    | &lt;leader&gt;tf | 打开浮动终端      | [toggleterm](https://github.com/akinsho/toggleterm.nvim) |
| n    | &lt;leader&gt;tg | 打开 lazygit 终端 | [toggleterm](https://github.com/akinsho/toggleterm.nvim) |
| n    | &lt;leader&gt;ta | 关闭所有底部终端  | [toggleterm](https://github.com/akinsho/toggleterm.nvim) |

另外，浮动终端和 lazygit 终端默认是进入插入模式的，浮动终端按下 &lt;esc&gt; 退出，lazygit 终端按下 q 退出。

![](https://images-1302522496.cos.ap-nanjing.myqcloud.com/img/202203121622011.gif)

### 查找相关

&lt;leader&gt;f 前缀都是查找相关的。

[telescope](https://github.com/nvim-telescope/telescope.nvim) 能够模糊查找一些文件。

它有一些外部依赖，你需要下载安装 [fd](https://github.com/sharkdp/fd) 和 ripgrep(https://github.com/BurntSushi/ripgrep)：

以 Arch 为例：

```
$ yay -S fd
$ yay -S repgrep
```

| 模式 | 键位             | 说明                   | 插件                                                          |
| ---- | ---------------- | ---------------------- | ------------------------------------------------------------- |
| n    | &lt;leader&gt;ff | 模糊查找文件           | [telescope](https://github.com/nvim-telescope/telescope.nvim) |
| n    | &lt;leader&gt;fg | 模糊查找文字           | [telescope](https://github.com/nvim-telescope/telescope.nvim) |
| n    | &lt;leader&gt;fo | 最近打开的文件         | [telescope](https://github.com/nvim-telescope/telescope.nvim) |
| n    | &lt;leader&gt;fh | 最近的搜索结果         | [telescope](https://github.com/nvim-telescope/telescope.nvim) |
| n    | &lt;leader&gt;fm | 查找最近的标记         | [telescope](https://github.com/nvim-telescope/telescope.nvim) |
| n    | &lt;leader&gt;ft | 在目录树中打开当前文件 | [nvim-tree](https://github.com/kyazdani42/nvim-tree.lua)      |
| n    | &lt;leader&gt;fn | 查找最近的消息记录     | [nvim-notify](https://github.com/rcarriga/nvim-notify)        |
| n    | &lt;leader&gt;fc | 在目录树中打开当前文件 | [nvim-tree](https://github.com/kyazdani42/nvim-tree.lua)      |

![](https://images-1302522496.cos.ap-nanjing.myqcloud.com/img/202203121556021.gif)

### 文字翻译

[translator](https://github.com/uga-rosa/translate.nvim) 可以翻译各种语言。它的维护者也很棒。

你需要下载安装 [translate-shell](https://github.com/soimort/translate-shell) 或者去注册 1 个 [deepl](https://www.deepl.com/en/docs-api/) 的帐号，这样才能获得翻译结果。

如果你使用的是 [deepl](https://www.deepl.com/en/docs-api/) 则还需额外安装 [curl](https://curl.se/) 和 [jq](https://github.com/stedolan/jq)。

下面是我设置的键位绑定，英文翻译成中文或者中文翻译成英文，在 [keybinds](../lua/core/keybinds.lua) 文件中你可以将它替换掉：

| 模式 | 键位              | 说明                         | 插件                                                     |
| ---- | ----------------- | ---------------------------- | -------------------------------------------------------- |
| n    | &lt;leader&gt;tcs | 将英文翻译成中文（拆分）     | [translator](https://github.com/uga-rosa/translate.nvim) |
| n    | &lt;leader&gt;tcr | 将英文替换成中文             | [translator](https://github.com/uga-rosa/translate.nvim) |
| n    | &lt;leader&gt;tcf | 将英文翻译成中文（浮动）     | [translator](https://github.com/uga-rosa/translate.nvim) |
| n    | &lt;leader&gt;tci | 将英文翻译结果插入至原文下方 | [translator](https://github.com/uga-rosa/translate.nvim) |
| n    | &lt;leader&gt;tes | 将中文翻译成英文（拆分）     | [translator](https://github.com/uga-rosa/translate.nvim) |
| n    | &lt;leader&gt;ter | 将中文替换成英文             | [translator](https://github.com/uga-rosa/translate.nvim) |
| n    | &lt;leader&gt;tef | 将中文翻译成英文（浮动）     | [translator](https://github.com/uga-rosa/translate.nvim) |
| n    | &lt;leader&gt;tei | 将中文翻译结果插入至原文下方 | [translator](https://github.com/uga-rosa/translate.nvim) |
| x    | &lt;leader&gt;tcs | 将英文翻译成中文（拆分）     | [translator](https://github.com/uga-rosa/translate.nvim) |
| x    | &lt;leader&gt;tcr | 将英文替换成中文             | [translator](https://github.com/uga-rosa/translate.nvim) |
| x    | &lt;leader&gt;tcf | 将英文翻译成中文（浮动）     | [translator](https://github.com/uga-rosa/translate.nvim) |
| x    | &lt;leader&gt;tci | 将英文翻译结果插入至原文下方 | [translator](https://github.com/uga-rosa/translate.nvim) |
| x    | &lt;leader&gt;tes | 将中文翻译成英文（拆分）     | [translator](https://github.com/uga-rosa/translate.nvim) |
| x    | &lt;leader&gt;ter | 将中文替换成英文             | [translator](https://github.com/uga-rosa/translate.nvim) |
| x    | &lt;leader&gt;tef | 将中文翻译成英文（浮动）     | [translator](https://github.com/uga-rosa/translate.nvim) |
| x    | &lt;leader&gt;tei | 将中文翻译结果插入至原文下方 | [translator](https://github.com/uga-rosa/translate.nvim) |

![](https://images-1302522496.cos.ap-nanjing.myqcloud.com/img/202203121559836.gif)

### 多光标操作

[vim-visual-multi](https://github.com/mg979/vim-visual-multi) 插件能为 neovim 提供多光标操作。

| 模式 | 键位        | 说明           | 插件                                                          |
| ---- | ----------- | -------------- | ------------------------------------------------------------- |
| n    | &lt;c-n&gt; | 选择下一个词汇 | [vim-visual-multi](https://github.com/mg979/vim-visual-multi) |
| n    | &lt;c-p&gt; | 取消当前选择   | [vim-visual-multi](https://github.com/mg979/vim-visual-multi) |
| n    | &lt;c-s&gt; | 跳过当前选择   | [vim-visual-multi](https://github.com/mg979/vim-visual-multi) |
| n    | &lt;esc&gt; | 退出多光标模式 | [vim-visual-multi](https://github.com/mg979/vim-visual-multi) |
| n    | &lt;tab&gt; | 切换多光标模式 | [vim-visual-multi](https://github.com/mg979/vim-visual-multi) |

![](https://images-1302522496.cos.ap-nanjing.myqcloud.com/img/202203181649057.gif)

### 范围选择

[nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) 插件中内置了一个范围选择的功能，在使用此插件前，你需要安装 [gcc](https://gcc.gnu.org/)。

下面是我对它绑定的键位（由于该功能不稳定，现在已被禁用，如果要开启请在 [nvim-treesitter](../lua/configure/plugins/nvim-treesitter.lua) 中打开）：

| 模式 | 键位        | 说明         | 插件                                                                  |
| ---- | ----------- | ------------ | --------------------------------------------------------------------- |
| n    | &lt;cr&gt;  | 开始范围选择 | [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) |
| n    | &lt;cr&gt;  | 扩大范围选择 | [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) |
| n    | &lt;bs&gt;  | 缩小范围选择 | [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) |
| n    | &lt;tab&gt; | 全选整个范围 | [nvim-treesitter](https://github.com/nvim-treesitter/nvim-treesitter) |

![](https://images-1302522496.cos.ap-nanjing.myqcloud.com/img/202203121624365.gif)

### 绘图模式

[venn](https://github.com/jbyuki/venn.nvim) 能够让我们在 neovim 中进行绘图。

下面是我设置的键位绑定：

| 模式 | 键位        | 说明         | 插件                                        |
| ---- | ----------- | ------------ | ------------------------------------------- |
| n    | &lt;c-k&gt; | 向上绘制线条 | [venn](https://github.com/jbyuki/venn.nvim) |
| n    | &lt;c-j&gt; | 向下绘制线条 | [venn](https://github.com/jbyuki/venn.nvim) |
| n    | &lt;c-h&gt; | 向左绘制线条 | [venn](https://github.com/jbyuki/venn.nvim) |
| n    | &lt;c-l&gt; | 向右绘制线条 | [venn](https://github.com/jbyuki/venn.nvim) |
| v    | b           | 绘制方块盒   | [venn](https://github.com/jbyuki/venn.nvim) |
| v    | f           | 填充区域     | [venn](https://github.com/jbyuki/venn.nvim) |

![](https://images-1302522496.cos.ap-nanjing.myqcloud.com/img/202203191542040.gif)

### 会话管理

[persisted](https://github.com/olimorris/persisted.nvim) 插件为 neovim 提供了会话管理，它默认会在每次退出 neovim 前保存会话。

| 模式 | 键位             | 说明         | 插件                                                     |
| ---- | ---------------- | ------------ | -------------------------------------------------------- |
| n    | &lt;leader&gt;ss | 手动保存会话 | [persisted](https://github.com/olimorris/persisted.nvim) |
| n    | &lt;leader&gt;sd | 删除保存会话 | [persisted](https://github.com/olimorris/persisted.nvim) |
| n    | &lt;leader&gt;sl | 恢复保存会话 | [persisted](https://github.com/olimorris/persisted.nvim) |

请注意，如果您使用了一些欢迎屏幕插件，那么可能会和该插件产生冲突。

### git

[gitsigns](https://github.com/lewis6991/gitsigns.nvim/) 插件提供了一些 git 可视化操作。

| 模式 | 键位           | 说明                           | 插件                                                    |
| ---- | -------------- | ------------------------------ | ------------------------------------------------------- |
| n    | [c             | 跳转到上一个 hunk              | [gitsigns](https://github.com/lewis6991/gitsigns.nvim/) |
| n    | ]c             | 跳转到下一个 hunk              | [gitsigns](https://github.com/lewis6991/gitsigns.nvim/) |
| n    | &lt;leader&gr; | 重置当前 hunk                  | [gitsigns](https://github.com/lewis6991/gitsigns.nvim/) |
| v    | &lt;leader&gr; | 重置当前范围的 hunk            | [gitsigns](https://github.com/lewis6991/gitsigns.nvim/) |
| n    | &lt;leader&gR; | 重置当前 buffer 的 hunk        | [gitsigns](https://github.com/lewis6991/gitsigns.nvim/) |
| n    | &lt;leader&gh; | 查看提交记录                   | [gitsigns](https://github.com/lewis6991/gitsigns.nvim/) |
| n    | &lt;leader&gl; | 切换行的 blame 信息            | [gitsigns](https://github.com/lewis6991/gitsigns.nvim/) |
| n    | &lt;leader&gd; | 查看当前 buffer 的 delete 操作 | [gitsigns](https://github.com/lewis6991/gitsigns.nvim/) |
| n    | &lt;leader&gv; | 查看当前 buffer 的 diff 视图   | [gitsigns](https://github.com/lewis6991/gitsigns.nvim/) |

### 其它按键

[switch](https://github.com/AndrewRadev/switch.vim) 插件能够快速的让 true 变为 false，或者 false 变为 true。

它的键位绑定是 gs，如果你想增加自定义的单词，可以在 [switch 插件配置文件](../lua/configure/plugins/switch.lua) 文件中新增。

![](https://images-1302522496.cos.ap-nanjing.myqcloud.com/img/202203121626121.gif)

[surround](https://github.com/ur4ltz/surround.nvim) 插件能快速的替换包裹，比如把 [] 替换为 ()，把 "" 替换成 ''。

下面是它的一些默认键位绑定：

```
ds[char]        删除包裹
cs[char][char]  修改包裹
ys[scope][char] 增加包裹
```

![](https://images-1302522496.cos.ap-nanjing.myqcloud.com/img/202203121627730.gif)

## 一些命令

### 查看 lsp 服务

下面是 LSP 服务的一些命令：

```
LSPInfo : 查看 LSP 运行状态
LSPInstallInfo : 查看 LSP 下载状态
```

### 查看报错信息

通过 &lt;leader&gt;fn 或者 :message 可查看到一些异常或者警告信息。

### 预览 markdown

如果要预览 markdown 文件，则需要下载 pandoc 和 live-server：

```
$ yay -S pandoc
$ npm install -g live-server
```

然后输入 :MarkdownPreview 命令即可。

### 定义代码片段

如果需要自定义代码片段，可输入 :VsnipOpen 命令。

## 常见问题

### 图标显示错误

需要安装 [nerd font](https://link.zhihu.com/?target=https%3A//www.nerdfonts.com/)，并且将终端字体设置为 Nerd font 的字体。

### 如何安装新的插件

我对 [packer](https://github.com/wbthomason/packer.nvim) 的配置做了一些简化。

在此之前当你需要向下面书写配置文件：

```
{
    "xxx",
    config = require("configure/plugins/xxx.lua")
}
```

但再此之后你可以更简单的配置：

```
{
    "xxx",
    load_file = true,
}
```

### 如何配置新的 LSP

请查看：

- https://github.com/williamboman/nvim-lsp-installer#available-lsps
- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md

LSP 配置放在 lua/configure/lsp/ 目录下。

为了能安装所有的该项目中内置的 LSP，你需要安装 nodeJS 以及 npm。

使用 :LSPInstallInfo 查看下载情况。

### 如何配置新的 DAP

请查看：

- https://github.com/mfussenegger/nvim-dap/wiki/Debug-Adapter-installation

我默认配置了 Python 和 Golang 的调试器，但你需要安装它们：

```
$ pacman -S delve
$ python3 -m pip install debugpy
```

### 如何配置新的 lint

请查看：

- https://github.com/mfussenegger/nvim-lint

### 为什么我的 Python 没有 LSP 诊断

我使用 pylint 进行诊断而不是 pyright，你可以下载一个 pylint：

```
$ pip3 install pylint
```
