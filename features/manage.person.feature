Feature: title
In order to value
As a role
I want feature

  Scenario: Create a new Person
    Given I have no Person
    And I go to the list of Person
    When I follow "new person"
    And I fill in "Name" with "Bruno Diniz"
    And I press "Create"
    Then I should see "Person was successfully created."
    And I should see "Bruno Diniz"
    And I should have 1 person

