class AddReferencesPeopleFromAccounts < ActiveRecord::Migration
  def self.up
    add_column :accounts, :people_id, :integer
  end

  def self.down
    remove_column :accounts, :people_id
  end
end

