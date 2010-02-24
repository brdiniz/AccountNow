Feature: Manage a account
In order: test
As a Bank
I want feature

  Scenario: Create a new account
    Given I have no Person
    And I have new Person with name is "Anthony Vivaldi"
    And I go to the list of Person
    When I follow "Anthony Vivaldi"
    And I should see "Anthony Vivaldi"
    When I follow "Registrar uma conta"
    And I fill in "Tipo" with "a receber"
    And I fill in "Data de vencimento" with "1/1/1900"
    And I fill in "Valor" with "10"
    And I should not see "Ex: a simple text"
    And I press "Salvar"
    Then I should see "Conta criado com sucesso!"
    And I should see "a receber"

