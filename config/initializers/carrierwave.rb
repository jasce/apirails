CarrierWave.configure do |config|

  # Use local storage if in development or test
 # config.cache_dir = "#{Rails.root}/tmp/uploads"

  # config.root = Rails.root.join('tmp') # adding these...
  #config.cache_dir = 'carrierwave' # ...two lines
  config.delete_tmp_file_after_storage = false
  #config.fog_provider = 'fog/aws'
  config.fog_credentials = {
  	provider:  'AWS',
  	aws_access_key_id:   'AKIAIEDU3A2EOD6MKOOA',
  	aws_secret_access_key:  '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',
  	#host:  's3-us-west-2.amazonaws.com',
  	region:  'us-west-2',

  }
  config.fog_directory = 'unclejoy'
  config.fog_public = true
  config.fog_attributes = { 'Cache-Control' => "max-age=#{365.day.to_i}" }

  

end