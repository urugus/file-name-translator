# ファイル名翻訳＆変換ツール

このツールは、指定したディレクトリ内のファイル名を翻訳し、スネークケース（snake_case）に変換して、別のディレクトリにコピーします。Google Cloud Translation API を使用してファイル名を指定した言語に翻訳します。

## 特徴

- ファイル名を指定した言語に自動翻訳
- 翻訳されたファイル名をスネークケースに変換
- オリジナルファイルから変換されたファイルを指定した別ディレクトリにコピー

## 必要条件

- Ruby 3.0以上
- Google Cloud Translation APIの認証情報ファイル（`credentials.json`）

## インストール

1. Clone repository.

   ```bash
   git clone https://github.com/urugus/file-name-translator.git
   cd file-name-translator
   ```

2. Install the library.

    ```bash
    gem install google-cloud-translate activesupport
    ```

3. Get & set Google Cloud Translation API credentials.

   ```bash
   export GOOGLE_APPLICATION_CREDENTIALS="path/to/credentials.json"
   ```

### Google Cloud 認証情報の取得手順

1.  Google Cloud Console にログイン:
    - Google Cloud Console にアクセスしてログインします。
2.  プロジェクトを作成または選択:
    - まだプロジェクトを作成していない場合は、新しいプロジェクトを作成してください。既にプロジェクトがある場合は、そのプロジェクトを選択します。
3.  API とサービス > 認証情報に移動:
    - 左側のメニューから「APIとサービス」を選択し、その下にある「認証情報」に移動します。
4.  サービスアカウントの作成:
    - 認証情報ページの上部にある「認証情報を作成」ボタンをクリックし、ドロップダウンメニューから「サービスアカウント」を選択します。
5.  サービスアカウントに必要な情報を入力:
    - 名前やIDを設定し、サービスアカウントの作成を進めます。
6.  キーの作成とダウンロード:
    - サービスアカウントを作成したら、「鍵（Keys）」セクションに移動し、「鍵を追加」 > 「新しい鍵を作成」を選択します。
    - JSON 形式を選択してキーをダウンロードします。このファイルが認証情報（credentials.json）になります。
7.  スクリプトで認証情報を使用:
    - ダウンロードした JSON ファイルのパスを config.credentials に設定します。
    - 例えば、JSON ファイルをプロジェクト内に credentials.json として保存した場合、以下のように設定します。

## 使い方

```rb
ruby file_name_translator.rb ~/path/to/original_dir ~/path/to/translated_dir
```
