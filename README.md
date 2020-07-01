# ちるどれんらく

## サイト概要

子どもを預かる施設にて利用する保護者との連絡ツール

### サイトテーマ

保育者にゆとりを、子どもと向き合う時間を

### テーマを選んだ理由

前職で、保護者との連絡ツールに非常に不便を感じていました。また紙ベースでのやりとりにより、伝達が十分に行われないことがありました。現場を見てきた私自身だからこそ安価で、理想のシステムを構築できるのではないかと考え、このテーマを選びました。

### ターゲットユーザ

学童や保育園の保育者

### 主な利用シーン

保育施設での児童管理や保護者との連絡

## 設計書

### 機能一覧

https://docs.google.com/spreadsheets/d/1VkMcbUaErn9sy6cioJIrw_9qh0R-E5k8SXxHGA3F1e0/edit?usp=sharing

### 実装予定機能

- 管理者機能（管理者ごとに、ルーム作成。複数の団体がそれぞれで機能を使える）
- 入退室管理（変更を顔認証でできる、手動でも可能、変更したときには保護者へメール送信）
- 予定表管理(フォームの URL を自動発行し、ActionMailer で送信。保護者がフォーム入力することで児童の予定表を一括管理）
- イベント出欠管理（フォームの URL を自動発行し、ActionMailer で送信。イベント出欠フォームに、解答を入力することで出欠確認が簡単にできる）
- 連絡網機能（メール送信、ファイル添付や画像添付をして送信できる、既読機能付）
- 児童一覧機能（登録してある児童の一覧、そのまま名簿として利用できる）
- プロフィール機能（名前、学年、兄弟、クラス、緊急連絡先、住所、アレルギー、特筆事項など）
- マイページ機能（ログイン後のトップページ、アイコン、プロフィール編集、施設のイベントをカレンダーで確認）

### 余裕があれば実装

- 保護者同士のチャットが行える機能（イベント委員ごとにルームの作成ができるなど）
- 写真管理機能（施設で撮った写真をアルバムで管理）
