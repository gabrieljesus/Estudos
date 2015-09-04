class HomePage
  include Capybara::DSL
  
  def load
    visit('http://www.walmart.com.br')
  end
  
  def search(searchText)
    fill_in('suggestion-search', :with => searchText)
    click_button('Procurar')
    SearchListPage.new()
  end
  
  def goToCart
    visit(find(:xpath, "//header[@id='site-topbar']/div[2]/div[@class='cart']/a")[:href])
    CartPage.new()
  end
  
  def login
    find(:xpath, "//*[@id='topbar-login-link']").click
  end
end