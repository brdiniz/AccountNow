Feature: Manage contract
In order to value
As a role
I want feature

Scenario: Create a new contract
  Given I have new Person with name is "Fornecedor contrato"
  And I have new Box with name is "Home"
  And I go to the list of Person
  And I should see "Fornecedor contrato"
  When I follow "Fornecedor contrato"
  And I should see "Fornecedor contrato"
  When I follow "Gerar Contrato / Financiamento"
  And I fill in "Descrição" from "Contrato para receber dinheiro"
  And I fill in "Documento" with "000123"
  And I fill in "Data do contrato" with "31/12/2009"
  And I select "a receber" from "account_kind"
  And I select "Home" from "account_box_id"
  And I fill in "Data de vencimento" with "1/1/2010"
  And I fill in "Valor total ou parcela" with "100.00"
  And I should not see "Ex: a simple text"
  And I press "Salvar"
  Then I should see "Criação de Contrato / Financiamento realizada com sucesso!"
  And I should see "a receber"
  And I should see "Home"
  


