Feature: Hellanzb queued NZB
  As a user
  I want to be able to access the queued NZBs
  To manipulate them

  Scenario: Accessing
    Given I connect
    And there are items in the queue
    When I access the first item
    Then it should be an NZB
