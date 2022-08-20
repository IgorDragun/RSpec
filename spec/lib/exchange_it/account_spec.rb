# frozen_string_literal: true

RSpec.describe ExchangeIt::Account do
  # Для изолирования тестируемого класса от других можно использовать заглушки
  # Полезно, когда инстанцирование постороннего класса - операция дорогостоящая
  let(:user_class) { Struct.new(:name, :surname) }
  let(:john) { described_class.new(user_class.new('John', 'Doe')) }
  let(:ann) { described_class.new(user_class.new('Ann', 'Smith')) }

  it 'has zero balance' do
    expect(john.balance).to eq(0)
  end

  it 'has proper uid' do
    expect(john.uid).to be_an_instance_of(String)
    hash = john.hash('John', 'Doe')
    expect(john.uid).to eq(hash)
  end

  describe '#deposit' do
    it 'allows to deposit correct sum' do
      ann.deposit(30)
      expect(ann.balance).to eq(30)
    end

    it 'does not allow to deposit a sum that negative' do
      expect { ann.deposit(-50) }.to raise_error(ExchangeIt::IncorrectSum, /must be positive/)
    end

    it 'does not allow to deposit a zero sum' do
      expect { ann.deposit(0) }.to raise_error(ExchangeIt::IncorrectSum, /must be positive/)
    end
  end

  # Для группировки тестов вместо 'describe' можно использовать 'context'
  context 'when performing money withdrawal' do
    # Чтобы не дублировать код по пополнению баланса Джона в тестах текущей группы,
    # можно использовать хуки
    before { john.deposit(100) }

    specify '#transfer' do
      expect(ann.balance).to eq(0)

      john.transfer(ann, 30)
      expect(john.balance).to eq(70)
      expect(ann.balance).to eq(30)
    end

    describe '#withdraw' do
      it 'allows to withdraw correct sum' do
        john.withdraw(40)
        expect(john.balance).to eq(60)
      end

      it 'does not allow to withdraw a sum that too large' do
        expect { john.withdraw(150) }.to raise_error(ExchangeIt::NotEnoughFunds, /Available: 100/)
      end

      it 'does not allow to withdraw a sum that negative' do
        expect { john.withdraw(-50) }.to raise_error(ExchangeIt::IncorrectSum, /must be positive/)
      end

      it 'does not allow to withdraw a zero sum' do
        expect { john.withdraw(0) }.to raise_error(ExchangeIt::IncorrectSum, /must be positive/)
      end
    end
  end
end
