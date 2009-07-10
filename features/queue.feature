Feature: Hellanzb Queue
  As a user
  I want to be able to inspect the queued NZBs

  Scenario: Checking
    Given I connect
    And there are items in the queue
    When I inspect the queue
    Then I should see a list of queued NZBs

  Scenario: Clearing
    Given I connect
    And there are items in the queue
    When I clear the queue
    Then the queue should be empty

  Scenario: Accessing
    Given I connect
    And there are items in the queue
    When I access an item
    Then I should get more details for that item
