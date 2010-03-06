class Person < ActiveRecord::Base
  has_many :accounts, :dependent => :destroy
  has_many :contracts, :dependent => :destroy
  has_many :bank

  include AccountFind

  TIPES = ["Física", "Juridica"]

  validates_presence_of :name, :tipe, :identifier, :email

  validates_uniqueness_of :email
  validates_uniqueness_of :identifier

  def <=>(other_person)
    self.name <=> other_person.name
  end

end

