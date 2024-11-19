source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '3.2.4'

gem "rails", "~> 7.2.0"

# Core gems
gem "bcrypt"

gem "bootsnap", ">= 1.18.0", require: false # Reduces boot times through caching; required in config/boot.rb
gem "cssbundling-rails", "1.4.0" # Bundle and process CSS [https://github.com/rails/cssbundling-rails]
gem "jbuilder" # Build JSON APIs with ease [https://github.com/rails/jbuilder]
gem "jsbundling-rails", "~> 1.3.o" # Bundle and transpile JavaScript [https://github.com/rails/jsbundling-rails]
gem "pg", "~> 1.5" # Use postgresql as the database for Active Record
gem "puma", "~> 6.4.3" # Use the Puma web server [https://github.com/puma/puma]
gem "redis", "~> 4.0" # Redis adapter for Active Job
gem "sprockets-rails" # The original asset pipeline for Rails [https://github.com/rails/sprockets-rails]
gem "stimulus-rails" # Hotwire's modest JavaScript framework [https://stimulus.hotwired.dev]
gem "tailwindcss-rails" # Use Tailwind CSS [https://github.com/rails/tailwindcss-rails]
gem "turbo-rails" # Hotwire's SPA-like page accelerator [https://turbo.hotwired.dev]

# Application gems


group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
end

group :development do
  gem 'listen', '>= 3.0.5', '< 3.2'
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
