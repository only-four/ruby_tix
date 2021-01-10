class ImageUploader < CarrierWave::Uploader::Base
  storage :fog
  def store_dir
    "uploads/#{model.class.to_s.underscore}/#{mounted_as}/#{model.id}"
  end

  def cache_dir
    '/tmp/projectname-cache'
  end
end
