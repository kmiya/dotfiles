# -*- sh -*-

# パッケージ管理システムを読み込む。
source ~/.zsh.d/package.zsh

# パッケージがインストールされていなければGitHubからcloneしてくる。
package-install github hchbaw/auto-fu.zsh
# パッケージを読み込む。
source $(package-directory hchbaw/auto-fu.zsh)/auto-fu.zsh
# auto-fuを初期化する。
zle-line-init() {
    auto-fu-init
}
zle -N zle-line-init
zle -N zle-keymap-select auto-fu-zle-keymap-select

# auto-fuをカスタマイズする。
## Enterを押したときは自動補完された部分を利用しない。
afu+cancel-and-accept-line() {
    ((afu_in_p == 1)) && { afu_in_p=0; BUFFER="$buffer_cur" }
    zle afu+accept-line
}
zle -N afu+cancel-and-accept-line
bindkey -M afu "^M" afu+cancel-and-accept-line

# z
# パッケージがインストールされていなければGitHubからcloneしてくる。
package-install github rupa/z
# パッケージを読み込む。

. $(package-directory rupa/z)/z.sh
