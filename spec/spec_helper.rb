# frozen_string_literal: true

# Файл для настройки тестовой среды (подклбчение вспомогательных файлов, настройка переменных среды и так далее)

# Подключаем наш основной файл приложения, который подключит все остальное
require_relative '../lib/exchange_it'

# Подключим решение для подгрузки переменных в среду
require 'dotenv/load'

# Подключаем решение Webmock для использования с RSpec
require 'webmock/rspec'

require_relative 'support/vcr'

# Подключаем все фалы из дирректории spec/support
Dir["#{File.dirname(__FILE__)}/support/**/*.rb"].sort.each { |f| require f }

# Настраиваем RSpec
RSpec.configure do |config|

  # Добавляем настройку для WebMock, чтобы он не конфликтовал с VCR
  # Развершаем WebMock отправлять запросы к реальным сервисам
  WebMock.allow_net_connect!

  WebMock::API.prepend(Module.new do
    extend self

    # Выключаем VCR если используется WebMock
    def stub_request(*args)
      VCR.turn_off!
      super
    end
  end)

  config.before { VCR.turn_on! }
end