Feature: Manage contract
In order to value
As a role
I want feature

Scenario: Create a new contract
  Given I have new Person with name is "Fornecedor contrato"
  And I have new Box with name is "Home"
  And I have a Bank with name "BankBoston" and code "4561"
  And I have a bank account with name "TesteBank" and Bank "BankBoston"
  And I go to the list of Person
  And I should see "Fornecedor contrato"
  When I follow "Fornecedor contrato"
  And I should see "Fornecedor contrato"
  When I follow "Gerar Contrato / Financiamento"
  And I fill in "Nome" with "Contrato para receber dinheiro"
  And I fill in "Número do contrato" with "000123"
  And I fill in "Data do contrato" with "1/10/2011"
  And I select "a receber" from "contract_account_kind"
  And I select "TesteBank" from "contract_bank_account_id"
  And I select "Home" from "contract_account_box_id"
  And I fill in "Data do vencimento" with "1/10/2011"
  And I fill in "Quantidade de parcelas" with "10"
  And I fill in "Valor da parcela" with "100.00"
  And I should not see "Ex: a simple text"
  And I press "Salvar"
  Then I should see "Criação de Contrato / Financiamento realizada com sucesso!"
  And I should see "a receber"
  And I follow "Visualizar" within "#contract_1_actions"
  And I should see "Home"

