Feature: Manage box
In order to value
As a role
I want feature

  Scenario: Create a new Box
    Given I have no Box
    And I go to the list of Box
    When I follow "Criar caixa"
    And I fill in "Nome" with "Casa"
    And I press "Salvar"
    Then I should see "Criação de Caixa realizada com sucesso!"
    And I should see "Casa"
    And I should have 1 box

  Scenario: Update an account in the box
    Given I have no Box
    And I have new Person with name is "Anthony Vivaldi"
    And I have new Box with name is "Home"
    And The Person named "Anthony Vivaldi" has an account kind "a receber" and document "doc_1" and box "Home" and Price "10"
    And I go to the list of Box
    When I follow "Visualizar"
    And I should see "Caixa Home"
    And I should see "Status"
    Then I follow "Editar"
    And I should see "Alterar Conta"
    And I select "Realizada" from "account_situation_id"
    And I fill in "Data do pagamento" with "1/1/1901"
    And I fill in "Valor do pagamento" with "100.00"
    Then I press "Salvar"
    And I should see "Alteração de Conta realizada com sucesso!"
    And I should see "Caixa Home"
    And I should see "Realizada"

