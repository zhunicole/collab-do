class AddApprovedToProject < ActiveRecord::Migration
  def self.up
    add_column :projects, :approved, :boolean, :default => false, :null => false
    add_index  :projects, :approved
  end

  def change
    add_column :projects, :approved, :boolean, default: true
  end


  def self.down
    remove_index  :projects, :approved
    remove_column :projects, :approved
  end

end
