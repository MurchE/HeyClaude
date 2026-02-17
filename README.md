# HeyClaude

A simple, elegant command-line interface to chat with Claude (Anthropic's AI) directly from your terminal.

**Zero dependencies.** **Cross-platform.** **One command.**

```bash
heyclaude "What is the capital of Massachusetts?"
# → Boston is the capital of Massachusetts.
```

## Why?

Sometimes you just want a quick answer without opening a browser, logging in, or context-switching. `heyclaude` gives you instant access to Claude (Haiku 4.5) from your terminal — perfect for quick lookups, code help, or brainstorming while you work.

## Features

- ✅ **Fast**: Uses Claude Haiku 4.5 (optimized for speed)
- ✅ **Terminal-optimized**: Responses formatted for readability in your shell
- ✅ **Cross-platform**: Works on Linux, macOS, WSL, and PowerShell (Windows)
- ✅ **Lightweight**: Just a shell script + your API key
- ✅ **No config files**: Uses environment variables

## Installation

### Linux / macOS / WSL (Bash/Zsh)

**Prerequisites:**
- `curl` (usually pre-installed)
- `jq` — Install with:
  - Ubuntu/Debian: `sudo apt install jq`
  - macOS: `brew install jq`
  - Other: See [jq installation](https://jqlang.github.io/jq/download/)

**Install:**

```bash
git clone https://github.com/YOUR_USERNAME/HeyClaude.git
cd HeyClaude
chmod +x install.sh
./install.sh
```

**Or manual install:**

```bash
# Copy script to ~/bin
mkdir -p ~/bin
cp heyclaude ~/bin/heyclaude
chmod +x ~/bin/heyclaude

# Add ~/bin to PATH (if not already)
echo 'export PATH="$HOME/bin:$PATH"' >> ~/.bashrc
source ~/.bashrc
```

**Set your API key:**

```bash
# Get your API key from https://console.anthropic.com/
export ANTHROPIC_API_KEY="sk-ant-..."

# Make it permanent (add to ~/.bashrc or ~/.zshrc):
echo 'export ANTHROPIC_API_KEY="sk-ant-..."' >> ~/.bashrc
source ~/.bashrc
```

### Windows (PowerShell)

**Install:**

1. Download `heyclaude.ps1` from this repo
2. Open PowerShell and run:

```powershell
# Allow local scripts to run
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

# Create PowerShell profile if it doesn't exist
if (!(Test-Path $PROFILE)) {
  New-Item -Path $PROFILE -Type File -Force
}

# Open profile for editing
notepad $PROFILE
```

3. Add this to your profile:

```powershell
# Set your API key (get from https://console.anthropic.com/)
$env:ANTHROPIC_API_KEY = "sk-ant-..."

# Load heyclaude function
. C:\path\to\heyclaude.ps1
```

4. Save, close, and reload:

```powershell
. $PROFILE
```

## Usage

```bash
heyclaude "your question here"
```

**Examples:**

```bash
heyclaude "explain quantum entanglement in simple terms"
heyclaude "what's the difference between let and const in javascript?"
heyclaude "write a haiku about debugging"
```

## How it works

1. You run: `heyclaude "your question"`
2. Script constructs a JSON request using `jq`
3. Sends it to Anthropic's API via `curl`
4. Extracts and prints just the response text

**Model:** Uses `claude-haiku-4-5-20251001` (latest Haiku) for fast, cost-effective responses.

**Cost:** ~$0.001 per request (Haiku pricing: $0.25/MTok input, $1.25/MTok output). A typical question costs less than a penny.

## Configuration

The script reads from the `ANTHROPIC_API_KEY` environment variable. No config files needed.

To customize the system prompt or model, edit the script directly:
- Bash: `~/bin/heyclaude`
- PowerShell: `heyclaude.ps1`

## Troubleshooting

**"command not found"**
- Make sure `~/bin` is in your PATH
- Reload your shell: `source ~/.bashrc`

**"ANTHROPIC_API_KEY not set"**
- Get your key from https://console.anthropic.com/
- Add to your shell profile (see installation steps)

**"jq: command not found"**
- Install jq: `sudo apt install jq` or `brew install jq`

**PowerShell: "scripts disabled"**
- Run: `Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser`

## License

MIT

## Contributing

PRs welcome! Ideas:
- Streaming responses
- Conversation history
- Multi-provider support (OpenAI, Gemini, etc.)
- Interactive mode

## Author

Built by [@murch](https://github.com/YOUR_USERNAME) as a quick utility for terminal-based AI access.

---

**Not affiliated with Anthropic.** You need your own API key from https://console.anthropic.com/
