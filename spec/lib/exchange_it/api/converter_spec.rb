RSpec.describe ExchangeIt::Api::Converter do
  specify "#convert" do
    # Если, например, необходимо протестировать метод, который вызывает другой затратный метод или сторонний ресурс,
    # можно использовать заглушки (Stub, Mock, Null object, Spy)

    # Создаем заглушку и присваиваем ее переменной
    converter_stub = instance_double 'ExchangeIt::Api::Converter'

    # Предоставляем доступ заглушке вызывать определенный метод с параметрами и возвращаемым значением
    allow(converter_stub).to receive(:convert).with(sum: 80).and_return(100)

    # Можно проверить, что метод, к которому заглушке был предоставлен доступ, был именно вызван
    expect(converter_stub).to receive(:convert).with(sum: 80)

    # Та же проверка, только пост факутм (Spy)
    # expect(converter_stub).to have_received(:convert).with(sum: 80).once

    expect(converter_stub.convert(sum: 80)).to eq(100)
  end
end