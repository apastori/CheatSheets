alias cdgitroot='cd "$(git rev-parse --show-toplevel)"'
ollama_prompt() {
  ollama run qwen3:4b-q4_K_M "$*"
}
newbash() {
    touch "$1"
    echo "#!/usr/bin/env bash" > "$1"
    chmod +x "$1"
}
