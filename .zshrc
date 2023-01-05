export MAIL=wooshin@student.42seoul.kr
alias ccc='gcc -Wall -Wextra -Werror'
alias norm='norminette -R CheckForbiddenSourceHeader'
alias normr='norminette -R CheckDefine'

# Load Homebrew config script
source $HOME/.brewconfig.zsh
export PATH="/Users/wooshin/.brew/opt/llvm/bin:$PATH"

#zsh plugins
git difftool -y -t vimdiff
alias gitdiff="git difftool -y -t vimdiff"
plugins=(
	git
	zsh-syntax-highlighting
	zsh-autosuggestions
)
