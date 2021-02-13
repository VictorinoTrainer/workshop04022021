Feature: Update Booking
  Este servicio es utilizado para poder
  actualizar las reservas que cuenta la
  pagina web

  Background:
    * url baseUrl
    * header Accept = 'application/json'

    Scenario: Verificar petición correcta para actualizar una reserva reciba 200
      * def SchemaUtils = Java.type('com.intuit.karate.restfulbooker.util.SchemaUtils')
      * string schema = read('classpath:restfulbooker/updatebooking/updatebooking-schema.json')
      * def CreateTokenResponse = call read('classpath:common/CreateToken.feature')
      * def accessToken = CreateTokenResponse.response.token
      Given path '/booking/' + 8
      And cookie token = accessToken
      And request
      """
      {
          "firstname" : "Querubin",
          "lastname" : "Angelito",
          "totalprice" : 111,
          "depositpaid" : true,
          "bookingdates" : {
              "checkin" : "2018-01-01",
              "checkout" : "2019-01-01"
          },
          "additionalneeds" : "Breakfast"
      }
      """
      When method PUT
      Then status 200
      And assert SchemaUtils.isValid(response, schema)