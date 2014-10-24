Feature: Serving static files
  Chaplin serves all static files in the public directory

  Scenario: Sending a request for a css file
    Given My project has a hello.txt file in the public directory
    And I start a Chaplin server
    When I send the request GET /hello.txt
    Then I should get the file as a response
