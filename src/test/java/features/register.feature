Feature: Register
  Background:
    * def url_base = 'https://reqres.in'
    * def json_data = read('classpath:json/dataRegister.json')


  @Register
  Scenario: Register tipo 1
    Given url url_base
    And path '/api/register'
    And request json_data
    When method get
    Then status 200
    And def name = response.data[1].name
    And match name == "fuchsia rose"
    * print response
