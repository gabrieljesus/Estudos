Feature: Buscar uma tv e adicionar ao carrinho de compras

Scenario: Buscar uma tv e adicionar ao carrinho
    Given I am on Walmart website
    Then I will search for "tv"
    Then I should see "resultados"
    Then I will select one tv
    Then I will add them to cart
    Then I will proceed to checkout and check the product name