今後のやり取りはすべて日本語で行ってください。

# プロジェクト概要

このプロジェクトは、Webhookを使用してDiscordチャンネルに通知を送信するためのPython製コマンドラインユーティリティです。テキストメッセージの送信や、画像ファイルの添付が可能です。

アプリケーションはPythonで記述されており、Discord APIとの通信には`requests`ライブラリを使用しています。Windowsで簡単に配布・使用できるよう、`PyInstaller`を使ってスクリプトを単一の実行ファイルにパッケージ化しています。

## 主要ファイル

- `main.py`: アプリケーションのロジックを含むメインのPythonスクリプト。コマンドライン引数を解析し、通知を送信します。
- `requirements.txt`: Pythonの依存関係（`requests`と`pyinstaller`）をリストアップしています。
- `build.bat`: PyInstallerを使用して実行ファイルをビルドするためのバッチスクリプトです。
- `discord_notifier.spec`: 実行ファイルをビルドするためのPyInstaller設定ファイルです。
- `dist/discord_notifier.exe`: ビルドプロセスによって生成される出力実行ファイルです。

## ビルドと実行

### 前提条件

1.  Python 3.xがインストールされていること。
2.  仮想環境の使用を推奨します。

### セットアップ

開発環境をセットアップするには、仮想環境を作成し、依存関係をインストールします。

```shell
python -m venv .venv
.\.venv\Scripts\activate
pip install -r requirements.txt
```

### スクリプトの実行

Pythonを直接使用してスクリプトを実行できます。

```shell
python main.py --webhook-url "YOUR_WEBHOOK_URL" --message "スクリプトからのハロー！" --image "path/to/your/image.png"
```

- `--webhook-url`: **(必須)** DiscordのWebhook URL。
- `--message`: **(必須)** 送信するメッセージの内容。
- `--image`: (任意) 添付する画像ファイルへのローカルパス。

### 実行ファイルのビルド

`discord_notifier.exe`ファイルをビルドするには、ビルドスクリプトを実行します。

```shell
.\build.bat
```

実行ファイルは`dist/`ディレクトリに作成されます。その後、コマンドラインから実行できます。

```shell
.\dist\discord_notifier.exe --webhook-url "YOUR_WEBHOOK_URL" --message "実行ファイルからのハロー！"
```

## 開発規約

- プロジェクトは標準的なPythonのコードスタイルを使用しています。
- コマンドライン引数は`argparse`モジュールを使用して解析されます。
- ネットワークの問題やファイルが見つからない場合のエラーハンドリングが実装されています。
- `build.bat`の`--onefile`フラグで定義されているように、簡潔さのためにプロジェクトは単一の実行ファイルとしてパッケージ化されます。
