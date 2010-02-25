class AddDocumentToAccount < ActiveRecord::Migration
  def self.up
    add_column :accounts, :document, :string
  end

  def self.down
    remove_column :accounts, :document
  end
end
