Feature: Manage a bank
In order: test
As a Bank
I want feature

  Scenario: Create a new bank
    Given I have no Bank
    And I go to the list of Bank
    And I should see "Cadastro de bancos"
    When I follow "Novo"
    And I fill in "Código" with "001"
    And I should not see "Ex: a simple text"
    And I fill in "Nome" with "BANCO DO BRASIL"
    And I press "Salvar"
    Then I should see "Bank criado com sucesso!"
    And I should see "001"
    And I should have 1 bank
