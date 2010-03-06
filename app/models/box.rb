class Box < ActiveRecord::Base
  has_many :accounts, :dependent => :destroy
  include AccountFind
end

