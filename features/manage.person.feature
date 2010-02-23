Feature: Manage person
In order to value
As a role
I want feature

  Scenario: Create a new Person
    Given I have no Person
    And I go to the list of Person
    When I follow "Criar cliente / fornecedor"
    And I fill in "Nome" with "Bruno Diniz"
    And I fill in "Tipo" with "FISICA"
    And I fill in "Identificador" with "1020"
    And I fill in "Endereço" with "CONSELHEIRO BROTERO"
    And I press "Salvar"
    Then I should see "Cliente / Fornecedor criado com sucesso!"
    And I should see "Bruno Diniz"
    And I should have 1 person

  Scenario: List a people
    Given I have no Person
    And I have new Person with name is "Steve Jobs"
    And I go to the list of Person
    And I should see "Nome"
    And I should see "Tipo"
    And I should see "Steve Jobs"
    And I should see "Ações"
    And I should see "Criar cliente / fornecedor"
    And I should not see "Link 1"
    And I should not see "Link 2"

  Scenario: Show a person
    Given I have no Person
    And I have new Person with name is "Willian Gates"
    And I go to the list of Person
    And I should see "Willian Gates"
    When I follow "Willian Gates"
    And I should see "Registrar uma conta"

