Feature: Hellanzb Queue
  As a user
  I want to be able to inspect the queued NZBs

    Scenario:
        Given there are items in the queue
        When I inspect the queue
        Then I should see a list of queued NZBs
