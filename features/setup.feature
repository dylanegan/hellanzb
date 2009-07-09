Feature: Setup
  In order to talk to hellanzb
  As a user
  I want to connect to the hellanzb XML-RPC server

  Scenario: Connecting
    Given the URL http://hellanzb:changeme@localhost:8760
    When I connect
    Then I should be able to talk to the server
