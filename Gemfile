source 'https://rubygems.org'
ruby "2.4.0"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end


gem 'pg', '~> 0.18'
gem 'puma', '~> 3.0'
gem 'rails', '~> 5.0.1'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'

gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'

gem "haml-rails", "~> 0.9"

gem "ridgepole", "0.6.5.beta14"

gem "action_args"

gem "ncode-syosetu-core"
gem "ncode-syosetu-polly"

gem "denv"
gem "foreman"

gem "aws-sdk-s3"

group :development, :test do
  gem 'byebug'
  gem 'pry-byebug'
  gem 'pry-rails'
  gem 'rspec-rails', '~> 3.5'
  gem 'rubocop'
end

group :development do
  gem 'listen', '~> 3.0.5'
  gem 'web-console', '>= 3.3.0'
end

gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
