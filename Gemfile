source 'https://rubygems.org'


# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.5.1'
# Use sqlite3 as the database for Active Record
gem 'geocoder'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
gem 'devise','~> 3.2'
gem 'coffee-script-source', '1.8.0'
gem "daemons"
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
# gem 'therubyracer', platforms: :ruby
#gem 'simple_token_authentication', '~> 1.0'
# Use jquery as the JavaScript library
gem 'jquery-rails'
gem 'carrierwave'
gem 'carrierwave-base64'
gem 'twilio-ruby'
gem 'delayed_job_active_record'
gem 'active_model_otp'

# Turbolinks makes following links in your web application faster. Read more: https://github.com/rails/turbolinks
gem 'turbolinks'
# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc
gem 'cancancan'
gem 'activeadmin', '~> 1.0.0.pre2'

gem "formtastic", github: "justinfrench/formtastic"
# Use ActiveModel has_secure_password
 gem 'bcrypt', '~> 3.1.7'
gem 'active_model_serializers'
# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'
  gem 'sqlite3'
end

group :development do
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
end
group :production do

	gem 'pg'
	gem 'rails_12factor'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
