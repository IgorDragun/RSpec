# frozen_string_literal: true

RSpec.describe ExchangeIt::User do
  # Создадим объект, общий для некоторых тестов
  # let(:user) {ExchangeIt::User.new 'John', 'Doe'}

  # При указании в 'describe' имени класса далее внутри блока можно использовать указатель 'described_class'
  # При необходимости использования объекта в тестах с отличным параметром, например, именем,
  # можно использовать метаданные
  let(:user) { |example| described_class.new(example.metadata[:name] || 'John', 'Doe') }

  # Для описани теста можно использовать 'it', 'specify', 'example':
  # specify - если тестируем какой-то метод ('.' - метод класса, '#' - метод экземпляра класса);
  # example - если тестируем разные значения для одного и того же метода;
  # it - во всех случаях, когда нужно подробно описать тест;

  it 'returns name' do
    expect(user.name).to eq('John')
  end

  # В тесте, в котором необходимо использовать общий объект, но с отличным параметром, определяем метаданные (name)
  it 'returns name as a string', name: nil do
    expect(user.name).to be_an_instance_of(String)
  end

  # Тесты можно отмечать тэгами и вызывать только определенные тесты
  it 'returns surname', :fast do
    expect(user.surname).to eq('Doe')
  end

  # Важные тесты можно также отмечать, используя приставку 'f' - это аналогично добавлению тега 'focus'
  it 'returns surname as a string' do
    user = described_class.new 'John', nil
    expect(user.surname).to be_an_instance_of(String)
  end

  specify '#account' do
    expect(user.account).to be_an_instance_of(ExchangeIt::Account)
  end

  it 'has zero balance by default' do
    expect(user.balance).to eq(0)
  end
end
