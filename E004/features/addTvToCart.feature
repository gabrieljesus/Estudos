Feature: Search for a tv and add to shopping cart

Scenario: Search for a tv and add to cart
    Given I am on Walmart website
    Then I will search for "tv"
    Then I should see "resultados"
    Then I will select one tv
    Then I should see the button "Adicionar ao carrinho"
    Then I will add them to cart
    Then I will proceed to checkout and check the product name
    Then I will go to the login page
    And Do a successfull signin