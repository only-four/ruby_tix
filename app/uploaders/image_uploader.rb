class ImageUploader < CarrierWave::Uploader::Base
  if Rails.env.production?
    storage :fog #Heroku, Use Amazon S3
  else
    storage :file
  end 
  
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def cache_dir
    '/tmp/projectname-cache'
  end
end
