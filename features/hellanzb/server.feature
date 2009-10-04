Feature: Server
  As a user
  I want to be able to manage a hellanzb instance

  Scenario: Running
    Given the config hellanzb.server.conf
    When I run an instance
    Then one should be running
