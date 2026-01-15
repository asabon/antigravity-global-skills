# standard-dev-flow helper script

function Get-IssueId {
    param([string]$branchName)
    if ($branchName -match "feature/issue-(\d+)-") {
        return $matches[1]
    }
    return $null
}

function Create-Branch {
    param(
        [int]$issueId,
        [string]$summary
    )
    $cleanSummary = $summary -replace '[^a-zA-Z0-9-]', '-' -replace '-+', '-' -replace '^-|-$', ''
    $branchName = "feature/issue-$issueId-$cleanSummary"
    Write-Host "Creating branch: $branchName"
    git checkout -b $branchName
}

function Create-PullRequest {
    param(
        [int]$issueId,
        [string]$title
    )
    $body = "Closes #$issueId`n`n## 概要`n`n## 変更内容`n`n## 検証結果"
    gh pr create --title "[$issueId] $title" --body $body
}
