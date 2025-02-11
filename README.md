# Marp Slides

Marpを使用したスライド管理用リポジトリです。

## ディレクトリ構成

```
.
├── src/                    # スライドのソースファイル
│   ├── images/            # 共通の画像ファイル
│   ├── themes/            # テーマファイル
│   └── {スライド名}/      # 各スライドのディレクトリ
│       ├── images/       # スライド固有の画像
│       └── index.md      # スライドのMarkdown
└── dist/                  # ビルド成果物
```

## 使用方法

### 1. 環境設定

1. VS Codeで「Marp for VS Code」拡張機能をインストール
2. Marpのインストール
   ```bash
   brew install marp-cli
   ```

### 2. スライドの作成

1. `src/` 配下に新しいディレクトリを作成
2. `index.md` を作成し、Marpフォーマットでスライドを作成

## 利用可能なコマンド

```bash
# プレビューサーバーの起動
make run/marp

# HTML形式でエクスポート
make export/html

# PDF形式でエクスポート
make export/pdf

# 未使用の画像を削除
make clean/images

# ビルド成果物の削除
make clean/all

# コマンド一覧の表示
make help
```