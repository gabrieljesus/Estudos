class SearchListPage
  include Capybara::DSL
  
  def selectFirstOccurrence
    find(:xpath, "//div[@id='category-products']/section/ul/li[1]/figure/a").click
    ProductPage.new
  end
end