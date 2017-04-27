source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'rails', '~> 5.0.1'
gem 'mysql2', '>= 0.3.18', '< 0.5'
gem 'puma', '~> 3.0'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'coffee-rails', '~> 4.2'
# gem 'therubyracer', platforms: :ruby
gem 'jquery-rails'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'devise'
gem 'devise-bootstrap-views'
gem 'devise-i18n'
gem 'devise-i18n-views'
gem 'bootstrap_form'
# gem 'redis', '~> 3.0'
# gem 'bcrypt', '~> 3.1.7'
# gem 'capistrano-rails', group: :development

#追加したgem
gem 'slim-rails'
gem 'font-awesome-rails'
gem 'nokogiri', '~> 1.6', '>= 1.6.8.1'
gem 'rails-i18n', '~> 5.0', '>= 5.0.1'
gem "font-awesome-rails"
gem "config"
gem 'draper', '3.0.0.pre1' #rails5に対応
gem 'cells'
gem 'enumerize', github: 'brainspec/enumerize', branch: :master
gem 'redis-rails'

group :development, :test do
  gem 'pry-rails'
  gem 'pry'
  gem 'thin'
  gem 'rspec-rails'
  gem 'rspec-its'
  gem 'rspec-mocks'
  gem 'rspec-activemodel-mocks'
  gem 'rspec-request_describer'
  gem 'factory_girl_rails'
  gem 'watchr'
  gem 'i18n_generators'
  gem 'foreman'
  gem 'spring', '~> 2.0', '>= 2.0.1'
  gem 'spring-commands-rspec'
  gem 'timecop' # 一時的に日時を変更できる
  gem 'rspec-retry' # 不安定なテストでretryできるようにする
  gem 'pry-stack_explorer'
  gem 'pry-doc'
  gem 'byebug', platform: :mri
end

group :test do
  gem 'capybara'
  gem 'poltergeist'
  gem 'json_spec'
  gem 'email_spec'
  gem 'capybara-user_agent'
  gem 'test-unit'
  gem 'test-queue'
  gem 'autodoc'
  gem 'database_cleaner'
end

group :development do
  gem 'web-console'
  gem 'listen'
  gem 'spring-watcher-listen'
  gem 'pry-state'
  gem 'tapp'
  gem 'view_source_map' # html にどのパーシャルなのかコメントでpathを記述してくれる
  gem 'html2slim' # erbからhamlへ変換する
  gem 'xray-rails' # cmd+shift+x でpartialなどを可視化
  gem 'rubocop', require: false
end

group :development, :staging do
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'awesome_print'
  gem 'bullet'
end



# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
