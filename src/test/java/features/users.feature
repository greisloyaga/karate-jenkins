Feature: Post endpoint test

  @Prueba_Api
  Scenario: Verificar un usuario especifico
    Given url urlBase
    And path 'posts'
    And param userId = 1
    When method GET
    Then status 200
    And assert response.length > 1
    And match responseType == 'json'
    * print "RESPONSE", response






