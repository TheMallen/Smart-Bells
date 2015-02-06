source 'https://rubygems.org'

# Gems used across all environments:

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.0'
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
end

group :test do
  # Nicer test reporters
  gem 'minitest-reporters'
  # Nicer test traces
  gem 'mini_backtrace'
  # More test enhancements
  gem 'guard-minitest'
end

group :production do
  # Use postgres as the production db (on Heroku)
  gem 'pg'
  # Used by Heroku to serve static assets
  gem 'rails_12factor'
  # Use Unicorn as the app server
  gem 'unicorn' unless Gem.win_platform? # Unicorn requires KGIO which does not run on windows
end
