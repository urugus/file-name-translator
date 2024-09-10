require 'fileutils'
require 'google/cloud/translate'
require 'active_support/core_ext/string'

# Google Cloud Translate API のクライアントを設定
translate = Google::Cloud::Translate.translation_v2_service do |config|
  config.credentials = "./credentials.json" # 認証情報のファイルパス
end

# 日本語ファイル名を翻訳し、スネークケースに変換
def translate_and_convert_filename(file_name, translate)
  # ファイル名の拡張子を分離
  base_name = File.basename(file_name, ".*")
  ext_name = File.extname(file_name)

  # Google Translate APIを使って英語に翻訳
  translation = translate.translate(base_name, to: 'en')

  # スネークケースに変換
  snake_case_name = translation.text.parameterize(separator: '_')

  # 新しいファイル名を返す
  "#{snake_case_name}#{ext_name}"
end

# ファイルをコピー
def copy_files_with_translation(source_dir, dest_dir, translate)
  Dir.glob("#{source_dir}/*").each do |file_path|
    if File.file?(file_path)
      new_file_name = translate_and_convert_filename(File.basename(file_path), translate)

      # コピー先のパスを生成
      new_file_path = File.join(dest_dir, new_file_name)

      # ファイルをコピー
      FileUtils.cp(file_path, new_file_path)
      puts "Copied #{file_path} to #{new_file_path}"
    end
  end
end

# 実行例
source_dir = ARGV[0]
dest_dir = ARGV[1]

copy_files_with_translation(source_dir, dest_dir, translate)
