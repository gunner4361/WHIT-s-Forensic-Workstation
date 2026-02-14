$policyPath = "C:\Program Files\Mozilla Firefox\distribution"
if (!(Test-Path -Path $policyPath)) {
    New-Item -ItemType Directory -Path $policyPath
}

$policyJson = @"
{
  "policies": {
    "Extensions": {
      "Install": [
        "https://addons.mozilla.org/firefox/downloads/latest/duckduckgo-for-firefox/latest.xpi"
      ]
    }
  }
}
"@

$policyJson | Out-File -FilePath "$policyPath\policies.json" -Encoding UTF8
