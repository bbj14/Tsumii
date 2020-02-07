require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

if Rails.env.production?
  CarrierWave.configure do |config|
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      provider: 'AWS',
      aws_access_key_id: Rails.application.credentials.aws(:access_key_id),
      aws_secret_access_key: Rails.application.credentials.aws(:secret_access_key),
      region: 'ap-northeast-1'  # S3バケット作成時に指定したリージョン。左記は東京を指す
    }
    config.fog_directory  = 'tsumii-image-store' # 作成したS3バケット名
  end
  # 日本語ファイル名の設定
  CarrierWave::SanitizedFile.sanitize_regexp = /[^[:word:]\.\-\+]/ 
end