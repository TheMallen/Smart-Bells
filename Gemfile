source 'https://rubygems.org'

# Gems used across all environments:

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.0'
# Filter query results easy
gem 'active_hash_relation'
# Include rails observers since they were removed in rails 4
gem 'rails-observers'
# Include the Bootstrap SCSS framework :)
gem 'bootstrap-sass', '~> 3.3.3'
# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# Use CoffeeScript for .coffee assets and views
gem 'coffee-rails', '~> 4.1.0'
# Use jquery as the JavaScript library
gem 'jquery-rails'
# Use ActiveModel has_secure_password
gem 'bcrypt', '3.1.7'
# Speed up page loading
gem 'turbolinks'

#api related
gem 'rack-cors'
gem 'pundit', '~> 0.3.0'
gem 'active_model_serializers', '0.9.2'
gem 'kaminari', '~> 0.16.1'
#gem 'redis-throttle', git: 'git://github.com/andreareginato/redis-throttle.git'


# Windows helpers
if Gem.win_platform?
  # Windows does not include zoneinfo files, so bundle the tzinfo-data gem
  gem 'tzinfo-data'
  # Makes test output nicer on windows
  gem 'wdm', '>= 0.1.0'
end

group :development, :test do
  # development and test can use simple sqlite dbs
  gem 'sqlite3'
  # Allows debugging with stop points
  gem 'byebug'
  # Faster loading on changes in development
  gem 'spring'
  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'
  # Test using RSPEC
  gem 'rspec-rails', '~> 3.0'
end

group :production do
  # Use postgres as the production db (on Heroku)
  #gem 'pg'
  # Used by Heroku to serve static assets
  gem 'rails_12factor'
  # Use Unicorn as the app server
  gem 'unicorn' unless Gem.win_platform? # Unicorn requires KGIO which does not run on windows
end
