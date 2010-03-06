Feature: Manage a account
In order: test
As a Bank
I want feature

  Scenario: Create a new account
    Given I have no Person
    And I have new Person with name is "Anthony Vivaldi"
    And I have new Box with name is "Home"
    And I have a Bank with name "BankBoston" and code "1001x"
    And I have a bank account with name "TesteBank" and Bank "BankBoston"
    And I go to the list of Person
    When I follow "Anthony Vivaldi"
    And I should see "Anthony Vivaldi"
    When I follow "Registrar uma conta"
    And I select "a receber" from "account_kind"
    And I select "Home" from "account_box_id"
    And I select "TesteBank" from "account_bank_account_id"
    And I fill in "Data de vencimento" with "1/1/2020"
    And I fill in "Documento" with "doc1"
    And I fill in "Valor" with "10"
    And I should not see "Ex: a simple text"
    And I press "Salvar"
    Then I should see "Criação de Conta realizada com sucesso!"
    And I go to the show of person "Anthony Vivaldi" month "1" from year "2020"
    And I should see "a receber"
    And I should see "Home"

  Scenario: Show a exist account
    Given I have no Person
    And I have new Person with name is "Anthony Vivaldi"
    And I have new Box with name is "Home"
    And The Person named "Anthony Vivaldi" has an account kind "a receber" and document "doc_1" and box "Home" and Price "10"
    And I go to the list of Person
    When I follow "Anthony Vivaldi"
    And I should see "Home"
    When I follow "Visualizar"
    And I should see "a receber"
    And I should see "Conta"
    And I should see "Home"
    And I should see "10.0"

