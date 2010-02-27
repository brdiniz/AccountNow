class Person < ActiveRecord::Base
  has_many :accounts, :dependent => :destroy
  has_many :contracts, :dependent => :destroy

  TIPES = ["Física", "Juridica"]

  validates_presence_of :name, :tipe, :identifier, :email

  validates_uniqueness_of :email
  validates_uniqueness_of :identifier

end

