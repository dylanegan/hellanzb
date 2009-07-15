Feature: Hellanzb Queue
  As a user
  I want to be able to inspect the queued NZBs
  And manipulate the queue itself

  Scenario: Checking
    Given I connect to hellanzb
    And there are items in the queue
    When I inspect the queue
    Then I should see a list of queued NZBs

  Scenario: Clearing
    Given I connect to hellanzb
    And there are items in the queue
    When I clear the queue
    Then the queue should be empty

  Scenario: Accessing
    Given I connect to hellanzb
    And there are items in the queue
    When I access an item
    Then I should get more details for that item

  Scenario: Dequeuing an item
    Given I connect to hellanzb
    And there are items in the queue
    When I dequeue an item
    Then it should no longer be in the queue

  Scenario: Moving an item down
    Given I connect to hellanzb
    And there are items in the queue
    When I move an item down the queue
    Then it should move down in the queue

  Scenario: Moving an item up
    Given I connect to hellanzb
    And there are items in the queue
    When I move an item up the queue
    Then it should move up in the queue

  Scenario: Forcing an item to download
    Given I connect to hellanzb
    And there are items in the queue
    When I force an item to start downloading
    Then it should start downloading
    And the current download should move in to the queue

  Scenario: Moving an item to the end of the queue
    Given I connect to hellanzb
    And there are items in the queue
    When I move an item to the end of the queue
    Then it should be at the end of the queue

  Scenario: Moving an item to any position
    Given I connect to hellanzb
    And there are items in the queue
    When I move an item to the second position
    Then it should be second in the queue

  Scenario: Moving an item to the front of the queue
    Given I connect to hellanzb
    And there are items in the queue
    When I move an item to the front of the queue
    Then it should be next to download
