# frozen_string_literal: true

source 'http://rubygems.org'

# Решение для установки внешних соединений
gem 'faraday', '~> 2.0'

group :test do
  gem 'rspec', '~> 3.10'

  # Решение для создания моков и тестирования запросов к внешним ресурсам
  gem 'webmock', '~> 3.14'
end

group :development do
  # Решение для подгрузки переменных в среду
  gem 'dotenv', '~> 2.7'

  gem 'rubocop', '~> 1.25.0'
  gem 'rubocop-performance', '~> 1.0'
  gem 'rubocop-rspec', '~> 2.0'
end
