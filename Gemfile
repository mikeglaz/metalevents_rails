source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.5'

# Bundle edge Rails instead: gem 'rails', github: 'rails/rails'
gem 'rails', '~> 5.2.3'
# Use mysql as the database for Active Record
gem 'mysql2', '>= 0.4.4', '< 0.6.0'
# Use Puma as the app server
gem 'puma', '~> 3.11'
# Use SCSS for stylesheets
# gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'uglifier', '>= 1.3.0'
# See https://github.com/rails/execjs#readme for more supported runtimes
gem 'mini_racer', platforms: :ruby

# Build JSON APIs with ease. Read more: https://github.com/rails/jbuilder
gem 'jbuilder', '~> 2.5'
# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use ActiveModel has_secure_password
gem 'bcrypt', '~> 3.1.7'

# Use ActiveStorage variant
# gem 'mini_magick', '~> 4.8'

# Use Capistrano for deployment
# gem 'capistrano-rails', group: :development

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.1.0', require: false

# MG
gem 'jquery-rails'  # required by bootstrap
gem 'slim-rails'
gem 'responders'
gem 'coderay'
gem 'decent_exposure', '3.0.0'
gem 'bootstrap', '~> 4.3.1'
gem 'bootstrap4-datetime-picker-rails'
gem 'font-awesome-sass', '4.7.0'
# gem 'sassc-rails'
gem 'sass-rails'
gem 'seed-fu'
# MG

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug' #, platforms: [:mri, :mingw, :x64_mingw]
  # MG
  gem 'rspec-rails'
  gem 'factory_bot_rails'
  gem 'pry'
  # gem 'guard-rspec', require: false
  # MG
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  # gem 'listen'#, '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  # gem 'spring'
  # gem 'spring-watcher-listen', '~> 2.0.0'

  gem 'guard'
  gem 'guard-livereload'

  # for deployment
  gem 'capistrano' #, '~> 3.11'
  gem 'capistrano-rails' #, '~> 1.4'
  gem 'capistrano-passenger' #, '~> 0.2.0'
  gem 'capistrano-rbenv' #, '~> 2.1', '>= 2.1.4'
end

group :test do
  gem 'capybara'
  gem 'faker'
  gem 'launchy'
end
