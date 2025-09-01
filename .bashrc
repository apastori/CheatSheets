alias cdgitroot='cd "$(git rev-parse --show-toplevel)"'
ollama_prompt() {
  ollama run qwen3:4b-q4_K_M "$*"
}
