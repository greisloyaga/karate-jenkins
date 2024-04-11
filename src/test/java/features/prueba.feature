Feature: Users endpoint test
  Background:
    Given url 'https://fakestoreapi.com/auth/login'
    * def credentials = { "username": "mor_2314","password": "83r5^_" }
    And request credentials
    When method post
    Then status 200
    * def token = response.token
    * print "El token es:", token

  @Authorization
  Scenario: Get a single product
    Given url 'https://fakestoreapi.com/products/1'
    * header Authorization = token
    When method get
    Then status 200
    And match $.title == "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops"
    * print response
