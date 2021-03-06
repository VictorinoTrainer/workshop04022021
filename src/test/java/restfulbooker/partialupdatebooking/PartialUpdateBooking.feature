Feature: Partial Update Booking
  Este servicio es utilizado para poder
  actualizar las reservas que cuenta la
  pagina web de manera parcial

  Background:
    * url baseUrl
    * header Accept = 'application/json'

  Scenario: Verificar petición correcta para actualizar parcialmente una reserva reciba 200
    * def CreateTokenResponse = call read('classpath:common/CreateToken.feature')
    * def accessToken = CreateTokenResponse.response.token
    Given path '/booking/' + 8
    And cookie token = accessToken
    And request
    """
    {
       "firstname" : "James",
       "lastname" : "Brown"
    }
    """
    When method PATCH
    Then status 200