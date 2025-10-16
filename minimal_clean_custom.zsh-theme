
vcs_status() {
    if git rev-parse --is-inside-work-tree &>/dev/null; then
        local git_status="$(git status --porcelain 2>/dev/null)"
        local status_message=""
        local untracked=0
        local staged=0
        local unstaged=0
        local conflicts=0
        local in_merge=0
        local in_rebase=0

        # Get git directory path
        local git_dir="$(git rev-parse --git-dir 2>/dev/null)"

        # Check for merge conflicts
        if [[ -f "$git_dir/MERGE_HEAD" ]]; then
            in_merge=1
            # Check if there are actual unmerged files
            if git ls-files --unmerged &>/dev/null | head -1 | grep -q .; then
                conflicts=1
            fi
        fi

        # Check for rebase conflicts  
        if [[ -d "$git_dir/rebase-merge" ]] || [[ -d "$git_dir/rebase-apply" ]]; then
            in_rebase=1
            # Check if there are actual unmerged files
            if git ls-files --unmerged &>/dev/null | head -1 | grep -q .; then
                conflicts=1
            fi
        fi

        # Priority: Show conflicts first, then ongoing operations, then normal status
        if ((conflicts)); then
            if ((in_merge)); then
                status_message="Merge conflict"
            elif ((in_rebase)); then
                status_message="Rebase conflict"
            else
                status_message="Conflict"
            fi
            # Use red for conflicts
            echo "${ZSH_THEME_GIT_PROMPT_PREFIX}%F{red}${status_message}%f${ZSH_THEME_GIT_PROMPT_SUFFIX}"
        elif ((in_merge)); then
            status_message="Merging"
            # Use yellow for ongoing operations
            echo "${ZSH_THEME_GIT_PROMPT_PREFIX}%F{yellow}${status_message}%f${ZSH_THEME_GIT_PROMPT_SUFFIX}"
        elif ((in_rebase)); then
            status_message="Rebasing"
            # Use yellow for ongoing operations
            echo "${ZSH_THEME_GIT_PROMPT_PREFIX}%F{yellow}${status_message}%f${ZSH_THEME_GIT_PROMPT_SUFFIX}"
        else
            # Original logic for normal Git status
            if [[ -n "$git_status" ]]; then
                if echo "$git_status" | grep -q '^??'; then
                    untracked=1
                fi
                if echo "$git_status" | grep -q '^[AMDR]'; then
                    staged=1
                fi
                if echo "$git_status" | grep -q '^.[MD]'; then
                    unstaged=1
                fi

                if ((untracked)); then
                    status_message+="Untracked files, "
                fi
                if ((staged)); then
                    status_message+="Changes staged, "
                fi
                if ((unstaged)); then
                    status_message+="Changes not staged, "
                fi
                status_message="${status_message%, }"  # Remove trailing comma

                echo "${ZSH_THEME_GIT_PROMPT_PREFIX}${ZSH_THEME_GIT_PROMPT_DIRTY}${status_message}${ZSH_THEME_GIT_PROMPT_SUFFIX}"
            else
                echo "${ZSH_THEME_GIT_PROMPT_PREFIX}${ZSH_THEME_GIT_PROMPT_CLEAN}Clean${ZSH_THEME_GIT_PROMPT_SUFFIX}"
            fi
        fi
    fi
}




# Set color based on user ID
if [ $UID -eq 0 ]; then 
    NCOLOR="red"
else 
    NCOLOR="white"
fi

# Git prompt configuration
ZSH_THEME_GIT_PROMPT_PREFIX="%{$reset_color%}%{$fg[white]%}["
ZSH_THEME_GIT_PROMPT_SUFFIX="%{$reset_color%}]"
ZSH_THEME_GIT_PROMPT_DIRTY="%{$fg[red]%}"
ZSH_THEME_GIT_PROMPT_CLEAN="%{$fg[green]%}"



# Set the main prompt
PROMPT='%{$fg[$NCOLOR]%}%B%n%b%{$reset_color%}:%{$fg[blue]%}%B%c/%b%{$reset_color%} $(vcs_status) $ '

# Time taken for the command
myprompt='[%*] [%B%(?.%F{green}.%F{red})%?%f%b]'
function preexec() {
    timer=$(print -P %D{%s%3.})
}

function precmd() {
    timeprompt=""
    if [ $timer ]; then
        now=$(print -P %D{%s%3.})
        local d_ms=$(($now - $timer))
        local d_s=$((d_ms / 1000))
        local ms=$((d_ms % 1000))
        local s=$((d_s % 60))
        local m=$(((d_s / 60) % 60))
        local h=$((d_s / 3600))

        if   ((h > 0)); then 
            timeprompt="${h}h${m}m${s}s"
        elif ((m > 0)); then 
            timeprompt="${m}m${s}.$(printf $(($ms / 100)))s" # 1m12.3s
        elif ((s > 9)); then 
            timeprompt="${s}.$(printf %02d $(($ms / 10)))s" # 12.34s
        elif ((s > 0)); then 
            timeprompt="${s}.$(printf %03d $ms)s" # 1.234s
        else 
            timeprompt="${ms}ms"
        fi
        timeprompt="%B%F{blue}${timeprompt} %f%b"
        unset timer
    fi
    export RPROMPT=${timeprompt}${myprompt}
}

