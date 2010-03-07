class Box < ActiveRecord::Base
  has_many :accounts, :dependent => :destroy
  include AccountsHelper
end

