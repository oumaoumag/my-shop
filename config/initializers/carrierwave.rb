CarrierWave.configure do |config|
  # Use local file storage for development
  config.storage = :file
  
  # Set the root path for uploads
  config.root = Rails.root.join('public')
  
  # Set the cache directory
  config.cache_dir = Rails.root.join('tmp', 'uploads')
  
  # Enable processing of images
  config.enable_processing = true
  
  # Set permissions for uploaded files
  config.permissions = 0644
  config.directory_permissions = 0755
  
  # Delete temporary files after storing
  config.delete_tmp_file_after_storage = true
end
