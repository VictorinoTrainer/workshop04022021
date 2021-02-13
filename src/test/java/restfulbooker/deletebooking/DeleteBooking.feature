Feature: Delete Booking
  Este servicio es utilizado para poder eliminar
  reservas por medio de su booking id

  Background:
    * url baseUrl

    Scenario: Verificar petición correcta para eliminar una reserva reciba 201
      * def CreateTokenResponse = call read('classpath:common/CreateToken.feature')
      * def accessToken = CreateTokenResponse.response.token
      Given path '/booking/' + 1
      And cookie token = accessToken
      When method DELETE
      Then status 201
