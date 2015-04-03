source 'https://rubygems.org'


#gem 'puma'
# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '4.2.0'
# Use sqlite3 as the database for Active Record
gem 'mysql2', '0.3.18'

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.0'
# bundle exec rake doc:rails generates the API under doc/api.
gem 'sdoc', '~> 0.4.0', group: :doc


gem 'devise'

gem 'haml-rails'
gem 'jquery-rails'
gem 'bootstrap-sass', '~> 3.1.1'
gem 'font-awesome-rails'

group :assets do
  gem 'sass-rails', '~> 5.0'
  gem 'coffee-rails', '~> 4.1.0'
  gem 'turbolinks'
  gem 'uglifier', '>= 1.3.0'
end

# Use ActiveModel has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Unicorn as the app server
# gem 'unicorn'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug'

  # Access an IRB console on exception pages or by using <%= console %> in views
  gem 'web-console', '~> 2.0'

  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
end



group :development do
  gem 'sextant' #Smart view routers  /rails/routes
  #gem 'bullet'  #find dublicates query to DB
  #gem 'rack-mini-profiler'
end

group :test do
  #Debbuging code
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'meta_request'

  gem 'nyan-cat-formatter', '~> 0.5.2'

  #Guard
  gem 'guard-rspec'

  # Rspec
  gem 'rspec-rails', '~> 3.0'
  gem 'factory_girl_rails', '~> 4.5'
  gem 'ffaker'
  gem 'database_cleaner', '~> 0.9.1'
end



