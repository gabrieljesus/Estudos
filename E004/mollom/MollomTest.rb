require "#{File.dirname(File.expand_path(__FILE__))}/PageObjects/MollomPage"
require 'test/unit'

class MollomTest < Test::Unit::TestCase

  def test_main
    mollomPage = MollomPage.new
    
    #criar um novo site definindo url e email
    assert_equal(200, mollomPage.createSite("teste.com.br", "teste@teste.com.br"))
    
    #chamada para validar a criacao
    assert_equal(200, mollomPage.check())
    
    #update da url e validar se foi atualizado com sucesso
    assert_equal(200, mollomPage.update("url", "teste1.com.br"))
    
    #update do email e validar se foi atualizado com sucesso
    assert_equal(200, mollomPage.update("email", "teste1@teste1.com.br"))
  end
end

