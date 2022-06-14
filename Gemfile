source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.1.0'

gem "rails", "~> 7.0.0"

gem "bcrypt"
gem "bootsnap", ">= 1.4.4", require: false # Reduces boot times through caching; required in config/boot.rb
gem "cssbundling-rails", ">= 0.1.0" # Bundle and process CSS [https://github.com/rails/cssbundling-rails]
gem "jbuilder" # Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "jsbundling-rails", "~> 0.1.0" # Bundle and transpile JavaScript [https://github.com/rails/jsbundling-rails]
gem "pg", "~> 1.1" # Use postgresql as the database for Active Record
gem "puma", "~> 5.0" # Use the Puma web server [https://github.com/puma/puma]
gem "redis", "~> 4.0"
gem "sprockets-rails" # The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem "stimulus-rails" # Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem "tailwindcss-rails" # Use Tailwind CSS [https://github.com/rails/tailwindcss-rails]
gem "turbo-rails" # Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'spring'
  gem 'web-console', '>= 3.3.0'
end

group :test do
  gem 'capybara', '>= 2.15'
  gem 'selenium-webdriver'
  gem 'webdrivers'
end

# Additonal application gems
gem 'rack-cors'
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
