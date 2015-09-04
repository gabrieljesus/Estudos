class ProductPage
  include Capybara::DSL
  
  def getProductName
    find(:xpath, "//*[@id='main']/article/div[1]/h1").value
  end
  
  def addToCart
    click_button('Adicionar ao carrinho')
    click_button('Continuar')
  end
end