Feature: Event
  In order View upcoming presentations
  As a user I should be able add an event

  Background:
    Given events Railsconf,LaConf

  Scenario: Non logged in User is able to see upcoming events
    Given I am on the homepage
    Then I should see "Railsconf" within "#events"
    And I should see "LaConf" within "#events"

  Scenario: Logged in user can see the add event link
    Given I have signed in with "email@person.com/password"
    And I am on the homepage
    Then I should see "Add" within "#addEvent"

  Scenario: Logged in user can follow the link to the add event page
    Given I have signed in with "email@person.com/password"
    And I am on the homepage
    When I follow "addEvent"
    Then I should see "Add an Event"

  Scenario: Logged in user can add an event
    Given I have signed in with "email@person.com/password"
    And I am on the add event page
    And I fill in "name" with "foo"
    When I press "Add Event"
    Then I should see "Event added sucessfully"

