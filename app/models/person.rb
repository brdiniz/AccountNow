class Person < ActiveRecord::Base
  validates_presence_of :name, :tipe, :identifier

  validates_uniqueness_of :identifier
end

