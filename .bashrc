alias cdgitroot='cd "$(git rev-parse --show-toplevel)"'
ollama_prompt() {
  ollama run qwen3:4b-q4_K_M "$*"
}
ollamacoder_prompt() {
  ollama run qwen2.5-coder:7b "$*"
}

newbash() {
    touch "$1"
    echo "#!/usr/bin/env bash" > "$1"
    chmod +x "$1"
}

alias obsidian-commit='cd ~/Desktop/notes && git add . && git commit -m "Update notes on $(date +"%Y-%m-%d %H:%M:%S")" && git push origin main'

alias books-commit='cd ~/Desktop/books && git add . && git commit -m "Update books on $(date +"%Y-%m-%d %H:%M:%S")" && git push origin main'


