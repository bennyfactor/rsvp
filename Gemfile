ruby '2.3.1'
source 'https://rubygems.org'

# Run `gem install mailcatcher` (do not add to Gemfile) to locally test mailers.

gem 'rails', '~> 4.2.7'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'haml'
gem 'feedjira'
gem 'rails_admin'
gem 'rabl'
gem 'dotenv-rails', :groups => [:development, :test, :production]

# Gems used only for assets and not required
# in production environments by default.
gem 'sass-rails'
gem 'rails-sass-images'
gem 'autoprefixer-rails'

# See https://github.com/sstephenson/execjs#readme for more supported runtimes
# gem 'therubyracer', :platforms => :ruby

gem 'uglifier', '>= 1.0.3'

group :development do
  gem 'byebug'
end

group :development, :production do
  gem 'mysql2'
end

group :test, :development do
  gem 'sqlite3'
end

group :staging do
  gem 'rails_12factor'
  gem 'pg'
end

group :production do
  gem 'therubyracer', :platforms => :ruby
end

gem 'jquery-rails'

# To use ActiveModel has_secure_password
# gem 'bcrypt-ruby', '~> 3.0.0'

# To use Jbuilder templates for JSON
# gem 'jbuilder'

# Use unicorn as the app server
# gem 'unicorn'

# Deploy with Capistrano
group :development do
  gem 'capistrano-rails',   '~> 1.1', require: false
  gem 'capistrano-bundler', '~> 1.1', require: false
end

gem 'devise'

gem 'mandrill-api'
