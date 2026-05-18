alias cdgitroot='cd "$(git rev-parse --show-toplevel)"'
ollama_prompt() {
  ollama run qwen3:4b-q4_K_M "$*"
}
ollamacoder_prompt() {
  ollama run qwen2.5-coder:7b "$*"
}
goose_prompt() {
    local temp_file=$(mktemp)
    for prompt in "$@"; do
        echo "$prompt" >> "$temp_file"
    done
    echo "exit" >> "$temp_file"
    goose session < "$temp_file"
    rm "$temp_file"
}

# Even simpler single prompt version
goose_ask() {
    echo -e "$*\nexit" | goose session
}
newbash() {
    touch "$1"
    echo "#!/usr/bin/env bash" > "$1"
    chmod +x "$1"
}

# Add Goose to PATH
export PATH="/c/Users/alfon/AppData/Local/Programs/Goose:$PATH"

# Add anaconda3 to PATH (lowercase for consistency)
export PATH="/c/Users/alfon/anaconda3:/c/Users/alfon/anaconda3/Scripts:/c/Users/alfon/anaconda3/condabin:$PATH"

# Add MSYS2 as fallback for tools not found elsewhere (e.g. rsync)
export PATH="$PATH:/c/msys64/usr/bin"

# Add MSYS2 UCRT as fallback for tools not found elsewhere(e.g. gcc)
export PATH="$PATH:/c/msys64/ucrt64/bin"

alias obsidian-commit='cd ~/Desktop/notes && git add . && git commit -m "Update notes on $(date +"%Y-%m-%d %H:%M:%S")" && git push origin main'

alias books-commit='cd ~/Desktop/code/code-books && git add . && git commit -m "Update books on $(date +"%Y-%m-%d %H:%M:%S")" && git push origin main'

alias save-bashrc='cp -f ~/.bashrc /c/Users/alfon/Desktop/code/CheatSheets/'

get_loc() {
  local user="$1"
  local repo="$2"
  local branch="$3"

  # Check if required arguments are provided
  if [ -z "$user" ] || [ -z "$repo" ]; then
    echo "Usage: get_loc <username> <repository> [branch]"
    return 1
  fi

  # If branch is provided, include it in the request
  if [ -n "$branch" ]; then
    curl -L -s "https://api.codetabs.com/v1/loc?github=${user}/${repo}&branch=${branch}" | jq .
  else
    curl -L -s "https://api.codetabs.com/v1/loc/?github=${user}/${repo}" | jq .
  fi

  # Return success code
  return 0
}

