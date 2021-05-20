source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.3'

gem 'devise'
gem 'dotenv-rails'
gem 'foreman'
gem 'rails', '~> 6.0.3'
gem 'mysql2', '>= 0.4.4'
gem 'puma', '~> 4.3'
gem 'sass-rails', '>= 6'
gem 'webpacker', '~> 4.0'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.7'
gem 'redis-rails'
gem 'sidekiq'
gem 'whenever', require: false
gem 'bootsnap', '>= 1.4.2', require: false
gem 'simple_form'

group :development, :test do
  gem 'action-cable-testing'
  gem 'factory_bot_rails'
  gem 'faker'
  gem 'pry-rails'
  gem 'rspec-rails', '~> 4.0.0'
  gem 'shoulda-matchers'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '~> 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'webdrivers'
  gem 'rspec-sidekiq'
  gem 'database_cleaner-active_record'
end
