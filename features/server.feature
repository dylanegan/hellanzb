Feature: Server
  As a user
  I want to be able to manage a hellanzb instance

  Scenario: Running
    Given the config hellanzb.conf
    When I run an instance
    Then one should be running

  Scenario:
    Given a URL http://hellanzb:changeme@localhost:8771 and the server is running
    When I connect to the server
    Then I can talk to the server
