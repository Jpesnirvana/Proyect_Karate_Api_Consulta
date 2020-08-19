Feature: sample karate test script
  for help, see: https://github.com/intuit/karate/wiki/IDE-Support

  Background:
    * url 'https://api-test1.utec.net.pe'
    * header Content-Type = 'application/json'


  Scenario: Payment Operation Void
    Then print = number
    Given path '/finance-api/v1/asbanc/payments/void'
    And request {"queryType": 1,"queryPayload": "73145859","document": "B001-00057551","date": "19072020","time": "121330","bank": 1020,"operation": "J1","business": "636"}
    Then print 'response---',response
    When method POST
    Then status 200
    And match response contains {"message": "success"}
    And match response.content contains {"asbancStatus" : "0"}
    And match response.content contains {"asbancMessage" : "TRANSACCION PROCESADA OK"}
    * def Cliente = result.response.content.client
    And assert result.response.content.client == Cliente
    Then print Cliente

