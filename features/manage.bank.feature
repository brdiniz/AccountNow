Feature: Manage a bank
In order: test
As a Bank
I want feature

  Scenario: Create a new bank
    Given I have no Bank
    And I go to the list of Bank
    And I should see "Listagem de Bancos"
    When I follow "Criar Banco"
    And I fill in "Código" with "001"
    And I should not see "Ex: a simple text"
    And I fill in "Nome" with "BANCO DO BRASIL"
    And I press "Salvar"
    Then I should see "Criação de Banco realizada com sucesso!"
    And I should see "001"
    And I should have 1 bank

  Scenario: List and Remove Banks
    Given I have no Bank
    And I have a Bank with name "Banco do Brasil" and code "001"
    When I go to the list of Bank
    And I should see "Listar Bancos"
    And I should see "Criar Banco"
    And I should see "Código"
    And I should see "Nome"
    And I should see "Visualizar"
    And I should see "Editar"
    And I should see "Remover"
    Then I follow "Remover"
    And I should not see "Visualizar"
    And I should not see "Editar"
    And I should not see "Remover"

  Scenario: Update a Bank
    Given I have a Bank with name "Banco Iphone" and code "409"
    And I go to the list of Bank
    And I should see "Banco Iphone"
    When I follow "Editar"
    And I should see "Alterar Banco Iphone"
    And I fill in "Código" with "408"
    And I fill in "Nome" with "Banco Mac"
    And I press "Salvar"
    Then I should see "Alteração de Banco realizada com sucesso!"
    And I should see "408"
    And I should see "Banco Mac"

