class AddPeopleIdFromAccounts < ActiveRecord::Migration
  def self.up
    remove_column :accounts, :people_id
    add_column :accounts, :person_id, :integer
  end

  def self.down
    remove_column :accounts, :person_id
    add_column :accounts, :people_id, :integer
  end
end

