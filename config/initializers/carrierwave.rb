CarrierWave.configure do |config|
  # config.fog_provider = 'fog/aws' #required
  config.fog_credentials = {
    provider:              'AWS', #required
    aws_access_key_id:     ENV["aws_access_key_id"], 
    aws_secret_access_key: ENV["aws_secret_access_key"], 
    region: 'ap-northeast-1', #optional, defaults to 'us-east-1'
    path_style: 'true',
    # host: 's3-ap-northeast-1.amazonaws.com',
    # use_iam_profile: true #optional, defaults to nil
  }
  config.fog_directory  = ENV["fog_directory"]           # required
# optional, defaults to {}
end
