zimfw() { source /Users/oscarviciana/.zim/zimfw.zsh "${@}" }
fpath=(/Users/oscarviciana/.zim/modules/git/functions /Users/oscarviciana/.zim/modules/utility/functions /Users/oscarviciana/.zim/modules/git-info/functions ${fpath})
autoload -Uz git-alias-lookup git-branch-current git-branch-delete-interactive git-dir git-ignore-add git-root git-stash-clear-interactive git-stash-recover git-submodule-move git-submodule-remove mkcd mkpw coalesce git-action git-info
source /Users/oscarviciana/.zim/_alias.sh
source /Users/oscarviciana/.zim/_functions.sh
source /Users/oscarviciana/.zim/modules/completion/init.zsh
source /Users/oscarviciana/.zim/modules/environment/init.zsh
source /Users/oscarviciana/.zim/modules/forgit/forgit.plugin.zsh
source /Users/oscarviciana/.zim/modules/git/init.zsh
source /Users/oscarviciana/.zim/modules/horizons/horizons.zsh-theme
source /Users/oscarviciana/.zim/modules/input/init.zsh
source /Users/oscarviciana/.zim/modules/termtitle/init.zsh
source /Users/oscarviciana/.zim/modules/utility/init.zsh
source /Users/oscarviciana/.zim/modules/zsh-autosuggestions/zsh-autosuggestions.zsh
source /Users/oscarviciana/.zim/modules/zsh-completions/zsh-completions.plugin.zsh
source /Users/oscarviciana/.zim/modules/zsh-history-substring-search/zsh-history-substring-search.zsh
source /Users/oscarviciana/.zim/modules/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh