source 'https://rubygems.org'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?('/')
  "https://github.com/#{repo_name}.git"
end

gem 'coffee-rails', '~> 4.2'
gem 'mysql2', '>= 0.3.18', '< 0.5'
gem 'puma', '~> 3.0'
gem 'rails', '~> 5.0.1'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
# gem 'therubyracer', platforms: :ruby
gem 'bootstrap_form'
gem 'carrierwave'
gem 'devise'
gem 'devise-bootstrap-views'
gem 'devise-i18n'
gem 'devise-i18n-views'
gem 'jbuilder', '~> 2.5'
gem 'jquery-rails'
gem 'rmagick'
gem 'toastr_rails'
gem 'turbolinks', '~> 5'

# gem 'redis', '~> 3.0'
# gem 'bcrypt', '~> 3.1.7'
# gem 'capistrano-rails', group: :development

# 追加したgem
gem 'cells'
gem 'config'
gem 'draper', '3.0.0.pre1' # rails5に対応
gem 'enumerize', github: 'brainspec/enumerize', branch: :master
gem 'font-awesome-rails'
gem 'font-awesome-rails'
gem 'nokogiri', '~> 1.6', '>= 1.6.8.1'
gem 'rails-i18n', '~> 5.0', '>= 5.0.1'
gem 'redis-rails'
gem 'slim-rails'

group :development, :test do
  gem 'byebug', platform: :mri
  gem 'factory_girl_rails'
  gem 'foreman'
  gem 'i18n_generators'
  gem 'pry'
  gem 'pry-doc'
  gem 'pry-rails'
  gem 'pry-stack_explorer'
  gem 'rspec-activemodel-mocks'
  gem 'rspec-its'
  gem 'rspec-mocks'
  gem 'rspec-rails'
  gem 'rspec-request_describer'
  gem 'rspec-retry' # 不安定なテストでretryできるようにする
  gem 'spring', '~> 2.0', '>= 2.0.1'
  gem 'spring-commands-rspec'
  gem 'thin'
  gem 'timecop' # 一時的に日時を変更できる
  gem 'watchr'
end

group :test do
  gem 'autodoc'
  gem 'capybara'
  gem 'capybara-user_agent'
  gem 'database_cleaner'
  gem 'email_spec'
  gem 'json_spec'
  gem 'poltergeist'
  gem 'test-queue'
  gem 'test-unit'
end

group :development do
  gem 'annotate'
  gem 'html2slim' # erbからhamlへ変換する
  gem 'listen'
  gem 'pry-state'
  gem 'rubocop', require: false
  gem 'spring-watcher-listen'
  gem 'tapp'
  gem 'view_source_map' # html にどのパーシャルなのかコメントでpathを記述してくれる
  gem 'web-console'
  gem 'xray-rails' # cmd+shift+x でpartialなどを可視化
end

group :development, :staging do
  gem 'awesome_print'
  gem 'better_errors'
  gem 'binding_of_caller'
  gem 'bullet'
end

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: %i[mingw mswin x64_mingw jruby]
