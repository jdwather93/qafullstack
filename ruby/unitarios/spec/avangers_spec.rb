class AvengersHeadQuarter
  attr_accessor :list

  def initialize
    self.list = []
  end

  def put(avenger)
    self.list.push(avenger)
  end
end

# TDD (Desenvolvimento guiado por testes)
describe AvengersHeadQuarter do
  it "deve adicionar um vingador" do
    hq = AvengersHeadQuarter.new

    hq.put("Spiderman")
    expect(hq.list).to eql ["Spiderman"]
  end

  it "deve adicionar um lista de vingadores" do
    hq = AvengersHeadQuarter.new
    hq.put("Thor")
    hq.put("Hulk")
    hq.put("Spiderman")

    res = hq.list.size > 0
    # Verifica se o registro se encontra na lista
    expect(hq.list).to include "Hulk"

    # Verifica se a lista é maior que zero
    expect(hq.list.size).to be > 0

    #Verifica o retorno boolean de res
    expect(res).to be true
  end

  it "thor deve ser o primeiro da lista" do
    hq = AvengersHeadQuarter.new

    hq.put("Thor")
    hq.put("Hulk")
    hq.put("Spiderman")

    expect(hq.list).to start_with("Thor")
  end

  it "Iroman deve ser o ultimo da lista" do
    hq = AvengersHeadQuarter.new

    hq.put("Thor")
    hq.put("Hulk")
    hq.put("Spiderman")
    hq.put("Iroman")

    expect(hq.list).to end_with("Iroman")
  end

  it "deve conter o sobrenome" do
    avenger = "Peter Parker"
    expect(avenger).to match(/Parker/)
    expect(avenger).not_to match(/Jeferson/)
  end
end

# # Guia de referência para os matchers

# # Um matcher no RSpec é um objeto que serve para verificar o comportamento esperado no nosso teste. Ele é usado para montar uma expectation do RSpec de dois modos diferentes:

# expect(actual).to matcher(expected)
# expect(actual).to_not matcher(expected)

# # Um exemplo para cada um dos modos de expectation pode ser:

# expect(1).to eq(1)
# expect(1).to_not eq(2)

# # Como mencionado na seção anterior, o RSpec vem com muitos built-in matchers para nos ajudar a escrever testes expressivos. Vamos dar uma olhada neles, começando pelos mais básicos, os "be matchers".
# # Matchers relacionados a truthy e falsy

# # Os be matchers servem para você testar se um objeto é avaliado como true ou false. Você pode usá-los do seguinte modo:

# # passa se obj é truthy (não nil ou não false)
# expect(obj).to be_true
# # passa se obj é falsy (nil ou false)
# expect(obj).to be_false
# # passa se obj é nil
# expect(obj).to be_nil
# # passa se obj é truthy (não nil e não false)
# expect(obj).to be

# # Os matchers de equidade
# # Os equality matchers servem para verificar se um objeto é igual a outro objeto. Existe mais de um matcher para esse tipo de verificação porque no Ruby existe mais de um modo de checar a equidade entre dois objetos, que são os seguintes:

# expect(a).to equal(b) # passa se a.equal?(b)
# expect(a).to be(b)    # passa se a.equal?(b)
# expect(a).to eql(b)   # passa se a.eql?(b)
# expect(a).to eq(b)    # passa se a == b

# # Matchers relacionados a arrays
# # O RSpec nos oferece alguns matchers específicos para verificação de arrays. O primeiro é o MatchArray. Esse matcher é usado para verificar se um array é "igual" a outro, independente da ordem dos seus elementos. Segue um exemplo de uso desse matcher:

# array = [1, 2, 3, 4]
# expect(array).to match_array([1, 2, 3, 4])
# expect(array).to match_array([4, 3, 2, 1])
# expect(array).not_to match_array([1, 2, 3])
# expect(array).not_to match_array([1, 2, 3, 4, 5])

# # Outro matcher relacionado à verificação de arrays é o Include Matcher. Você pode usá-lo para verificar a relação de pertinência entre um ou mais elementos e um determinado array. Segue um exemplo de uso:

# array = [1, 2, 3, 4]
# expect(array).to include(1)
# expect(array).to include(1, 2, 3)
# expect(array).to include(1, 2, 3, 4)
# expect(array).not_to include(0)
# expect(array).not_to include(5)
# expect(array).not_to include(5, 6, 7, 8)
# expect(array).not_to include([1, 2, 3, 4])

# # Por fim, existem também os matchers start_with e end_with que servem para verificar se um array começa ou termina com uma sequência de elementos. Segue um exemplo de uso desses array = [1, 2, 3, 4]:

# array = [1, 2, 3, 4]
# expect(array).to start_with(1)
# expect(array).to start_with(1, 2)
# expect(array).not_to start_with(2)
# expect(array).to end_with(4)
# expect(array).to end_with(3, 4)
# expect(array).not_to end_with(3)

# # Matchers relacionados a strings
# # O RSpec oferece alguns matchers relacionados a strings, sendo que alguns deles são os mesmos usados para verificar arrays. Vamos começar olhando o Match Matcher, que serve para verificar o valor de uma string de acordo com uma expressão regular:

# string = "qa ninja"
# expect(string).to match(/qa/)
# expect(string).to match(/inja/)
# expect(string).not_to match(/ka/)
# expect(string).not_to match(/qaninja/)

# # Agora seguem exemplos dos matchers usados por strings e arrays, começando pelo include:

# string = "qa ninja"
# expect(string).to include("q")
# expect(string).to include("qa")
# expect(string).to include("qa", "ninja")
# expect(string).not_to include("ka")
# expect(string).not_to include("ninjas")

# # Por fim, você também pode usar os matchers start_with e end_with com strings:

# string = "qa ninja"
# expect(string).to start_with("qa")
# expect(string).not_to start_with("ninja")
# expect(string).to end_with("ninja")
# expect(string).not_to end_with("qa")
