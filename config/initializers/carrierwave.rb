require 'carrierwave/storage/abstract'
require 'carrierwave/storage/file'
require 'carrierwave/storage/fog'

CarrierWave.configure do |config|  
if Rails.env.development? || Rails.env.test? #追記部分
  config.storage = :file  #追記部分
elsif Rails.env.production? #追記部分
  config.storage = :fog
  config.fog_provider = 'fog/aws'
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: Rails.application.secrets.aws_access_key_id,
    aws_secret_access_key: Rails.application.secrets.aws_secret_access_key,
    region: 'ap-northeast-1'
  }

  config.fog_directory  = 'mercari52c'
  config.asset_host = 'https://s3-ap-northeast-1.amazonaws.com/mercari52c'
end

# CarrierWave.configure do |config|
#   if Rails.env.development? || Rails.env.test? #追記部分
#     config.storage = :file
#   elsif Rails.env.production?
#     config.storage = :fog
#     config.fog_provider = 'fog/aws'
#     config.fog_credentials = {
#       provider: 'AWS',
#       aws_access_key_id: 'アクセスキー',
#       aws_secret_access_key: 'シークレットキー',
#       region: 'ap-northeast-1'
#     }
#    end
# end