Feature: Get Booking Ids
  Este servicio es utilizado para
  poder consultar todos los ids
  de las reservas de RestfulBooker

  Background:
    * url baseUrl
    * header Accept = 'application/json'

    Scenario: Verificar peticion correcta al obtener todos los Booking Ids
      Given path '/booking'
      When method GET
      Then status 200
