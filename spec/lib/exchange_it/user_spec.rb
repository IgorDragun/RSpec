# frozen_string_literal: true

RSpec.describe ExchangeIt::User do
  # Создадим объект, общий для некоторых тестов
  # let(:user) {ExchangeIt::User.new 'John', 'Doe'}

  # При указании в 'describe' имени класса далее внутри блока можно использовать указатель 'described_class'
  let(:user) { described_class.new 'John', 'Doe' }

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
end
