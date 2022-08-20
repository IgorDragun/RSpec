# frozen_string_literal: true

RSpec.describe ExchangeIt::Utils::Uid do
  # Для тестирования модулей со вспомогательными функциями, таких как Uid, который подключается к классу Account,
  # их нужно также к чему-то подключить
  # include described_class - ТАК ДЕЛАТЬ НЕЛЬЗЯ!!!

  # Подключение всего модуля напрямую к тесту грозит конфликтом имен
  # Лучше использовать класс-заглушку
  let(:dummy) { Class.new { include ExchangeIt::Utils::Uid }.new }
  # Class.new { include ExchangeIt::Utils::Uid } - создает класс-заглушку;
  # .new - инстанцирует его.

  # Тесты, покрывающие определнную фичу, для удобства можно группировать, используя тот же 'describe'
  describe '#hash' do
    it 'returns nil when no args were given' do
      expect(dummy.hash).to be_nil
    end

    it 'returns string when at least 1 arg was given' do
      expect(dummy.hash('str1')).to be_instance_of(String)
    end
  end
end
