---
marp: true
paginate: true
theme: newmo
footer: © 2025 newmo | #roscafe
---

<!-- _class: title -->
# モノレポ開発のエラー、誰が見る？
## Datadog で実現する適切な<br>トリアージとエスカレーション

##### newmo株式会社<br>岩見彰太

##### github: @BIwashi<br>x: @B_Sardine

---


<style scoped>
  .profile-icon {
    width: 400px;
    float: right;
    margin-right: 20px;
    margin-top: -20px;
  }
</style>

<img src="../images/shota.jpeg" class="profile-icon"  />


<img class="qrcode" src="../images/qr-shota.png">



# 自己紹介

## 岩見彰太
### Software Engineer<br >newmo株式会社<br >
#### Platform Team

CyberAgent → newmo

#### [GitHub: BIwashi](https://github.com/BIwashi)<br >[X: @B_Sardine](https://x.com/B_Sardine)

<!-- <img src="../images/shota.jpeg" class="profile-image" />
<img src="../images/qr-shota.png" class="qrcode" />

</div> -->

---

<!-- _class: highlight-box -->
<div>

# 本日のテーマ

モノレポ開発における
エラー管理とトリアージの最適化

</div>

---

<!-- _class: split -->

![](https://placehold.jp/00a724/ffffff/500x300.png)

# モノレポ開発とは

- 全てのコードを単一のリポジトリで管理
- マイクロサービスとしての独立性を維持
- 開発効率と保守性の両立

---

# 課題：エラー管理の複雑さ

### エラーのオーナーシップが不明確
- 複数のマイクロサービス
- チーム間の責任範囲
- エスカレーションの難しさ

### アラート疲れ
- 過剰な通知
- チャンネルの分散
- 優先度の判断

---

<!-- _class: split -->

# Error Tracking の活用

![](https://placehold.jp/00a724/ffffff/400x500.png)

- Status管理による優先度付け
- Regressionの自動検知
- Issue/Case Managementとの連携

---

<!-- _class: highlight -->

# 解決策：Reference Table

### Service Name
### ↓
### Slack Group ID
### ↓
### 適切なチームへの通知

---

<!-- _class: split -->

![](https://placehold.jp/00a724/ffffff/400x300.png)

# Reference Table の活用

- サービス名とチームの紐付け
- GitHub Actions による自動更新
- GCSを活用したデータ管理

---

# 実装のポイント

### 1. CSV管理
- GitHubでマッピング情報を管理
- PRベースでの更新フロー

### 2. 自動更新の仕組み
- GitHub Actions
- GCS連携
- Datadogとの同期

### 3. モニタリング設定
- Reference Tableの活用
- 適切なメンション設定

---

<!-- _class: highlight-box -->
<div>

# 今後の展望

- Terraform による Monitor 管理
- Slack User Group の IaC 化
- OpenTelemetry との統合

</div>

---

# まとめ

### 1. エラー管理の一元化
- 単一チャンネルでの管理
- オーナーシップの明確化

### 2. 適切なエスカレーション
- 自動的なチーム振り分け
- 優先度に基づくトリアージ

### 3. 保守性の向上
- コード化された設定
- 自動化された更新フロー