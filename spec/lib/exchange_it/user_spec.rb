# frozen_string_literal: true

RSpec.describe ExchangeIt::User do
  # Создадим объект, общий для некоторых тестов
  # let(:user) {ExchangeIt::User.new 'John', 'Doe'}

  # При указании в 'describe' имени класса далее внутри блока можно использовать указатель 'described_class'
  let(:user) { described_class.new 'John', 'Doe' }

  # Для описани теста можно использовать 'it', 'specify', 'example':
  # specify - если тестируем какой-то метод ('.' - метод класса, '#' - метод экземпляра класса);
  # example - если тестируем разные значения для одного и того же метода;
  # it - во всех случаях, когда нужно подробно описать тест;

  it 'returns name' do
    expect(user.name).to eq('John')
  end

  it 'returns name as a string' do
    user = described_class.new nil, 'Doe'
    expect(user.name).to be_an_instance_of(String)
  end

  it 'returns surname' do
    expect(user.surname).to eq('Doe')
  end

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
