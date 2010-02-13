class Person < ActiveRecord::Base
  has_many :accounts

  TIPES = ["Física", "Juridica"]

  validates_presence_of :name, :tipe, :identifier

  validates_uniqueness_of :identifier
end

