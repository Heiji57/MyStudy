---
"notion_id": "31c3b799-4291-8094-87e0-c41b47b1b59d"
"notion_url": "https://www.notion.so/31c3b7994291809487e0c41b47b1b59d"
---

<empty-block/>
\$rng = \[System.Security.Cryptography.RandomNumberGenerator\]::Create()<br>\$bytes = New-Object byte\[\] 64<br>\$rng.GetBytes(\$bytes)
\[Convert\]::ToBase64String(\$bytes)
