require 'httparty'
require 'test/unit'
require 'AddressVO'

class E002Class < Test::Unit::TestCase
  #CEP valido
  def test_valid_cep
    response = HTTParty.get('http://cep.correiocontrol.com.br/01152010.json')
    
    addressVO = AddressVO.new(response.body)
    assert_equal(200, response.code)
    assert_equal("Barra Funda", addressVO.getBairro())
    assert_equal("01152010", addressVO.getCep())
    assert_equal("São Paulo", addressVO.getLocalidade())
    assert_equal("Rua Lopes de Oliveira", addressVO.getLogradouro())
    assert_equal("SP", addressVO.getUf())
  end
  
  #CEP invalido com um exemplo de erro esperado pelo teste
  def test_invalid_cep
    assert_raise JSON::ParserError do
      response = HTTParty.get('http://cep.correiocontrol.com.br/00000000.json')
      
      addressVO = AddressVO.new(response.body)
    end
  end
    
  #CEP mal formatado
  def test_dirty_cep
    response = HTTParty.get('http://cep.correiocontrol.com.br/011520100.json')
    assert_equal(200, response.code) #em rest esse codigo deveria ser diferente de 200 pois deu erro
    assert_equal("correiocontrolcep({\"erro\":true});\n", response.body)
  end
    
  #CEP com letras
  def test_cep_with_letters
    response = HTTParty.get('http://cep.correiocontrol.com.br/A1152010.json')
    assert_equal(200, response.code) #em rest esse codigo deveria ser diferente de 200 pois deu erro
    assert_equal("correiocontrolcep({\"erro\":true});\n", response.body)
  end
  
  #CEP vazio
  def test_empty_cep
    response = HTTParty.get('http://cep.correiocontrol.com.br/.json')
    assert_equal(200, response.code) #em rest esse codigo deveria ser diferente de 200 pois deu erro
    assert_equal("correiocontrolcep({\"erro\":true});\n", response.body)
  end
end
