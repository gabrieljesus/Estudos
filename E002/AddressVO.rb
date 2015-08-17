require 'json'

class AddressVO
  def initialize(addressJson)
      @parsedAddress = JSON.parse(addressJson)
  end
  
  def getBairro
    @parsedAddress["bairro"]
  end
  
  def getLogradouro
    @parsedAddress["logradouro"]
  end
  
  def getCep
    @parsedAddress["cep"]
  end
  
  def getUf
    @parsedAddress["uf"]
  end
  
  def getLocalidade
    @parsedAddress["localidade"]
  end
end