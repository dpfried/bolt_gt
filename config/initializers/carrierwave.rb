CarrierWave.configure do |config|
    config.root = Rails.root.join('tmp')
    config.cache_dir = 'carrierwave'

    config.fog_credentials = {
      :provider               => 'AWS',      
      :aws_access_key_id      => ENV['S3_KEY'],
      :aws_secret_access_key  => ENV['S3_SECRET'],
    }
    config.fog_directory  = 'boltgt'                    
    config.fog_host       = 'https:/boltgt.s3.amazonaws.com'
 
end
