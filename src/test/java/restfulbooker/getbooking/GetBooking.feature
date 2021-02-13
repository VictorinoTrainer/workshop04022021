Feature: Get Booking
  Este servicio es utilizado para poder
  consultar 1 reserva a traves de su
  booking id

  Background:
    * url baseUrl
    * header Accept = 'application/json'

    Scenario: Verificar petición correcta con una reserva id reciba cod 200
      Given path '/booking/' + 4
      When method GET
      Then status 200
      And match response.firstname == 'Susan'
      And match response.lastname == 'Smith'
      And match response.totalprice == 199
      And match response.depositpaid == false
      And match response.bookingdates.checkin == '2016-06-21'
      And match response.bookingdates.checkout == '2017-12-07'
      And match response.firstname == '#string'
      And match response.lastname == '#string'
      And match response.totalprice == '#number'
      And match response.depositpaid == '#boolean'
      And match response.bookingdates.checkin == '#string'
      And match response.bookingdates.checkout == '#string'