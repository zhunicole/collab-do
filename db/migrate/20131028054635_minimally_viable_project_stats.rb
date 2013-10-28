class MinimallyViableProjectStats < ActiveRecord::Migration
  def change

  	add_column :projects, :difficulty, :integer
  	add_column :projects, :seeking, :text
  	add_column :projects, :stage, :integer
  	add_column :projects, :num_interested, :integer  
  end
end
