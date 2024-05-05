source "https://rubygems.org"

ruby "3.2.2"

gem "rails", "~> 7.1.2"

gem "pg", "~> 1.1"
gem "puma", ">= 5.0"

gem "jbuilder"

gem "bcrypt", "~> 3.1.7"
gem 'dotenv-rails', groups: [:development, :test]

gem "tzinfo-data", platforms: %i[ windows jruby ]

gem 'jwt'

gem "bootsnap", require: false

gem "rack-cors"

gem 'kaminari'

group :development, :test do
  gem "debug", platforms: %i[ mri windows ]
  gem 'rspec-rails', '~> 6.1', '>= 6.1.2'
  gem 'factory_bot_rails', '~> 6.2'
  gem 'rails-controller-testing'
end

group :development do
end

gem "aws-sdk-s3", require: false
gem 'open-uri'
