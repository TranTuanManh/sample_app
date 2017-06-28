source "https://rubygems.org"

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem "bootstrap-sass", "3.3.7"
gem "coffee-rails", "~> 4.2"
gem "eslint-rails"
gem "jbuilder", "~> 2.5"
gem "jquery-rails"
gem "pg"
gem "puma", "~> 3.0"
gem "rails", "~> 5.0.4"
gem "rails_best_practices"
gem "rubocop", require: false
gem "rubocop-checkstyle_formatter", require: false
gem "sass-rails", "~> 5.0"
gem "scss_lint", require: false
gem "turbolinks", "~> 5"
gem "uglifier", ">= 1.3.0"

group :development, :test do
  gem "byebug", platform: :mri
  gem "sqlite3"
end

group :development do
  gem "listen", "~> 3.0.5"
  gem "spring"
  gem "spring-watcher-listen", "~> 2.0.0"
  gem "web-console", ">= 3.3.0"
end

group :test do
  gem "minitest"
  gem "minitest-reporters"
  gem "rails-controller-testing"
end

gem "tzinfo-data", platforms: [:mingw, :mswin, :x64_mingw, :jruby]
