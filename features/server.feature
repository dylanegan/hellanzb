Feature: Server
  As a user
  I should be able to control the server

  Scenario: Pausing
    Given I connect
    And the server is processing
    When I pause the server
    Then it should stop processing

  Scenario: Continuing
    Given I connect
    And the server is paused
    When I tell it to continue
    Then it should start processing

  Scenario: Shutting down
    Given I connect
    When I shut down the server
    Then the connection should fail

  Scenario: Clear everything
    Given I connect
    When I clear all downloads
    Then nothing should be downloading or queued

  Scenario: Cancel the current download
    Given I connect
    And the queue is empty
    When I cancel the current download
    Then there should be no current download
