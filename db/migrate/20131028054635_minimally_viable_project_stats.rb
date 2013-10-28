class MinimallyViableProjectStats < ActiveRecord::Migration
  def change

  	add_column :projects, :difficulty, :string
  	add_column :projects, :seeking, :text
  	add_column :projects, :stage, :text
  	add_column :projects, :num_interested, :integer 
  	add_column :projects, :project_email, :string
  end
end
