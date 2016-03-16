#source 'https://rubygems.org'
source 'https://ruby.taobao.org'
ruby '1.9.3'

gem 'rails', '4.2.5.1'

#must set sass version as '2.3.2.0' to avoid the ruby version requirement >=2.0
gem 'bootstrap-sass', '2.3.2.0'

group :development, :test do
  gem 'sqlite3'
  gem 'rspec-rails'
  gem 'guard-rspec'
end

group :test do
  gem 'selenium-webdriver'
  gem 'capybara'
end

gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.1.0'
gem 'jquery-rails'
gem 'turbolinks'
gem 'jbuilder', '~> 2.0'
gem 'sdoc', '~> 0.4.0', group: :doc

group :production do
  gem 'pg', '0.15.1'
end
