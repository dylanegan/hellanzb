Feature: Hellanzb Status 
  As a user
  I want to be able to inspect the status of hellanzb in more details

  Scenario: Reading
    Given I connect to hellanzb
    When I request the status
    Then I can read the status
