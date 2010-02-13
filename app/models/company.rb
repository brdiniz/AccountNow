class Company < ActiveRecord::Base
  belongs_to :people

  validates_uniqueness_of :people_id
end

