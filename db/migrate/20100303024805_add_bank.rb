class AddBank < ActiveRecord::Migration
  def self.up
    Person.create!(:name => "Banco Bradesco SA", :email => "contato@bradesco.com.br", :tipe => "Juridica", :identifier => "60746948000112", :address => "Cidade de Deus, SN, Vila Yara")
    Bank.create!(:code => "237", :name => "Banco Bradesco", :person => Person.find_by_name("Banco Bradesco SA"))

    Person.create!(:name => "Itau Unibanco SA", :email => "contato@itau.com.br", :tipe => "Juridica", :identifier => "60701190000104", :address => "Av do Estado, 5533, 2A")
    Bank.create!(:code => "479", :name => "Banco Itau", :person => Person.find_by_name("Itau Unibanco SA"))

    Person.create!(:name => "Banco do Brasil SA", :email => "contato@bb.com.br", :tipe => "Juridica", :identifier => "00000000000191", :address => "Setor Bancário Sul - SBS - Edifício Sede III, 19, andar")
    Bank.create!(:code => "001", :name => "Banco do Brasil", :person => Person.find_by_name("Banco do Brasil SA"))

    Person.create!(:name => "Caixa Economica Federal", :email => "contato@caixa.com.br", :tipe => "Juridica", :identifier => "00360305000104", :address => "Quadra SEPN 511 Bloco D, S/N, Lotes 4/5")
    Bank.create!(:code => "104", :name => "Caixa Economica Federal", :person => Person.find_by_name("Caixa Economica Federal"))
  end

  def self.down
    Bank.find_by_code("001").destroy
    Bank.find_by_code("104").destroy
    Bank.find_by_code("237").destroy
    Bank.find_by_code("479").destroy

    Person.find_by_name("Caixa Economica Federal").destroy
    Person.find_by_name("Banco do Brasil SA").destroy
    Person.find_by_name("Itau Unibanco SA").destroy
    Person.find_by_name("Banco Bradesco SA").destroy
  end
end

