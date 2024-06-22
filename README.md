# dotfiles

## git setup

```shell
git config --global user.name "John Doe"
git config --global user.email johndoe@example.com
git config --global core.excludefiles ~/.gitignore_global
git config --global http.proxy http://user:passwd@proxy_host:proxy_port
git config --global https.proxy https://user:passwd@proxy_host:proxy_port

git config --list
```

## git clone

```shell
git clone https://github.com/marzg510/dotfiles.git
```

## git remote add

```shell
git remote add origin https://github.com/marzg510/dotfiles.git
```

## Create Link

### Linux

- link.sh

### Windows

- link.bat

## Using Tools

### FileBackup.vbs

1. Win+R
2. Input `shell:sendto`
3. Create ShortCut to `wintools/FileBackup.vbs`

## gVim Setting(for Win11)

1. Get [gVim](https://www.vim.org/download.php)
2. Install gVim
3. Link to vimrc

コマンドプロンプト(管理者)

```dos
cd <<user_home(ex. C:\Users\usename)>>
mklink .vimrc  .\dotfiles\vimrc
mklink .gvimrc .\dotfiles\gvimrc
```
