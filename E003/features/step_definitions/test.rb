Given(/^I am on Walmart website$/) do
  visit 'http://www.walmart.com.br'
end

Then(/^I will search for "([^"]*)"$/) do |searchText|
  fill_in 'suggestion-search', :with => searchText
  click_button('Procurar')
end

Then(/^I should see "([^"]*)"$/) do |arg1|
  page.has_content?(arg1)
end

Then(/^I will select one tv$/) do
  find(:xpath, "//div[@id='category-products']/div[1]//li[contains(@class, 'item-0')]/figure/a").click
  page.has_xpath?("//*[@id='main']/article/div[1]/h1")
  $productName = find(:xpath, "//*[@id='main']/article/div[1]/h1").value
end

Then(/^I will add them to cart$/) do
  click_button('Adicionar ao carrinho')
  click_button('Continuar')
end

Then(/^I will proceed to checkout and check the product name$/) do
  find(:xpath, "//header[@id='site-topbar']/div[2]/div[@class='cart']/a").click
  page.has_content?($productName)
end
