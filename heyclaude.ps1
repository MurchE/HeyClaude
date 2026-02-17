# HeyClaude - Terminal interface to Claude API (PowerShell)
# Usage: heyclaude "your question here"

function heyclaude {
  param([string]$query)

  if (-not $query) {
    Write-Host "Usage: heyclaude `"your question`""
    return
  }

  if (-not $env:ANTHROPIC_API_KEY) {
    Write-Host "Error: ANTHROPIC_API_KEY environment variable not set"
    Write-Host "Get your API key from: https://console.anthropic.com/"
    return
  }

  $headers = @{
    "x-api-key" = $env:ANTHROPIC_API_KEY
    "anthropic-version" = "2023-06-01"
    "content-type" = "application/json"
  }

  $body = @{
    model = "claude-haiku-4-5-20251001"
    max_tokens = 1000
    system = "You are a helpful assistant optimized for terminal display. Be concise and direct. Use short lines, minimal formatting, and structure output for readability in a terminal. Answer in 1-3 short paragraphs maximum."
    messages = @(@{role = "user"; content = $query})
  } | ConvertTo-Json -Depth 10

  try {
    $response = Invoke-RestMethod -Uri "https://api.anthropic.com/v1/messages" -Headers $headers -Body $body -Method Post
    return $response.content[0].text
  }
  catch {
    Write-Host "Error calling Claude API: $_"
  }
}
