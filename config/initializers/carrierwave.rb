CarrierWave.configure do |config|
  if Rails.env.production?
    config.root = Rails.root.join('tmp')
    config.cache_dir = 'carrierwave'

    config.storage = :s3
    config.s3_access_key_id = 'AKIAIKHT6JOP6M7KKVYQ'
    config.s3_secret_access_key = 'akQLSAujJIRQcENS7YWV2htyFMpLa2vtcxAqV0'
    config.s3_bucket = 'boltgt'
  else
    config.storage = :file
  end
end
