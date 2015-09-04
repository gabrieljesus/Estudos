Given(/^I am on Walmart website$/) do
  @homePage = HomePage.new()
  @homePage.load
end

Then(/^I will search for "([^"]*)"$/) do |searchText|
  @searchListPage = @homePage.search(searchText)
end

Then(/^I should see "([^"]*)"$/) do |content|
  has_content?(content)
end

Then(/^I will select one tv$/) do
  @productPage = @searchListPage.selectFirstOccurrence()
end

Then(/^I should see the button "([^"]*)"$/) do |content|
  has_content?(content)
end

Then(/^I will add them to cart$/) do
  @productName = @productPage.getProductName()
  @productPage.addToCart()
end

Then(/^I will proceed to checkout and check the product name$/) do
  @cartPage = @homePage.goToCart()
  has_content?(@productName)
end

Then(/^I will go to the login page$/) do
  @homePage.login()
end

Then(/^Do a successfull signin$/) do
  @signInPage = SignInPage.new
  @signInPage.login(ENV['USER'], ENV['PASS'])
end