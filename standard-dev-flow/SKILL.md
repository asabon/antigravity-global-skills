---
name: standard-dev-flow
description: 案件の起票からブランチ作成、PR発行までの一連の開発プロセスを標準化するスキル
---

# 標準開発フロー (standard-dev-flow)

このスキルは、GitHub を活用した標準的な開発サイクルを自動化・支援します。

## プロセス概要

1. **起票 ([/issue-new](file:///C:/Users/asabo/.gemini/antigravity/skills/standard-dev-flow/SKILL.md#L15-L20))**: 新しい案件を GitHub Issue として作成し、`docs/progress/task.md` に追記します。
2. **開始 ([/start-task](file:///C:/Users/asabo/.gemini/antigravity/skills/standard-dev-flow/SKILL.md#L22-L28))**: 特定の Issue に基づいて作業ブランチを作成し、チェックアウトします。
3. **完了報告 ([/submit-pr](file:///C:/Users/asabo/.gemini/antigravity/skills/standard-dev-flow/SKILL.md#L30-L36))**: 作業内容をまとめ、Pull Request を作成します。

## 詳細手順

### 1. 案件の起票 (`/issue-new`)
ユーザーからの依頼に基づき、以下の操作を行います。
- `gh issue create` コマンドを使用して、GitHub に Issue を作成する。
- 作成された Issue ID を取得し、`docs/progress/task.md` に新しい項目を追加する。
- 命名規則: タイトルは日本語で分かりやすく記述する。

### 2. 作業の開始 (`/start-task`)
特定の Issue ID を指定して、開発環境を整えます。
- 命名規則に従ってブランチを作成する: `feature/issue-<ID>-<short-description>`
- 最新の `main` または `develop` からブランチを切り、チェックアウトする。
- `docs/progress/task.md` のステータスを更新する。

### 3. Pull Request の作成 (`/submit-pr`)
作業完了後、レビューを依頼します。
- 作業内容の要約（Walkthrough）を生成する。
- `gh pr create` を実行する。
- タイトル形式: `[Issue ID] 概要`
- 本文: 対応内容、テスト結果、および Issue へのリンク（`Closes #<ID>`）を含める。

## 指示 (Instructions)
- Git 操作を行う際は、常にユーザーの許可（`SafeToAutoRun: false`）を得ること。
- ブランチ名や PR タイトルに日本語を含めないこと（システムの安定性のため）。
- `gh` コマンドが未インストールの場合は、ユーザーに報告すること。
