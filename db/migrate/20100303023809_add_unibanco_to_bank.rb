class AddUnibancoToBank < ActiveRecord::Migration
  def self.up
    Person.create!(:name => "União de Bancos Brasileiros S.A.", :email => "contato@unibanco.com.br", :tipe => "Juridica", :identifier => "33700394000140", :address => "RUA JOAO MOREIRA SALES, 130, BLOCO - D1")
    Bank.create!(:code => "409", :name => "Unibanco", :person => Person.find_by_name("União de Bancos Brasileiros S.A."))
  end

  def self.down
    Bank.find_by_code("409").destroy
    Person.find_by_name("União de Bancos Brasileiros S.A.").destroy
  end
end

