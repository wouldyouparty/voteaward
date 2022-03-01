source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.5'

gem 'rails', '~> 6.0.2', '>= 6.0.2.2'

# db
gem 'pg', '>= 0.18', '< 2.0'

# auth
gem 'devise'
gem 'cancancan'

# i18n
gem 'http_accept_language'

# tools
gem 'acts-as-taggable-on', '~> 6.0'
gem 'ancestry'
gem "scoped_search"
gem 'acts_as_votable'

# front
gem 'sass-rails', '>= 6'
gem 'haml-rails', '~> 1.0'
gem 'webpacker', '~> 4.0'
gem 'jbuilder', '~> 2.7'

# Use Redis adapter to run Action Cable in production
# gem 'redis', '~> 4.0'
# Use Active Model has_secure_password
# gem 'bcrypt', '~> 3.1.7'

# Use Active Storage variant
gem 'mini_magick', '~> 4.8'
gem 'image_processing', '~> 1.12'

# Use Puma as the app server
gem 'puma', '~> 4.1'

# Reduces boot times through caching; required in config/boot.rb
gem 'bootsnap', '>= 1.4.2', require: false

# Use Capistrano for deployment
gem 'capistrano', '~> 3.11'
gem 'capistrano-rails', '~> 1.4', group: :development
gem 'capistrano-rbenv', '~> 2.1', '>= 2.1.4'
gem 'capistrano3-puma' , group: :development

group :development, :test do
  # Call 'byebug' anywhere in the code to stop execution and get a debugger console
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  # Access an interactive console on exception pages or by calling 'console' anywhere in the code.
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  # Spring speeds up development by keeping your application running in the background. Read more: https://github.com/rails/spring
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
