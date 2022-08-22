require 'vcr'

# Настройки для VCR
VCR.configure do |c|

  # Игнорируем запросы к codeclimate.com и не записываем результаты в кассету
  c.ignore_hosts 'codeclimate.com'

  # Используем адаптер webmock
  c.hook_into :webmock

  # Настройки для кассеты
  c.default_cassette_options = {

    # Декодируем ответ от сервера, если тот был сжать определенным образом
    decode_compressed_response: true
  }

  # Определяем путь для хранения кассет
  c.cassette_library_dir = File.join(
    File.dirname(__FILE__ ), '..', 'fixtures', 'vcr_cassettes'
  )

  # Скрываем уникальный токен пользователя, чтобы он не отображался в кассете
  c.filter_sensitive_data('<LOKALISE_API_TOKEN>') {
    ENV.fetch('LOKALISE_API_TOKEN', 'hidden')
  }
end