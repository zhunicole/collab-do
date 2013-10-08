class AddAttributesToUsers < ActiveRecord::Migration
  def change
  	add_column :users, :first_name, :string
  	add_column :users, :last_name, :string
  	add_column :users, :location, :string
  	add_column :users, :avatar, :string
  	add_column :users, :blurb, :text
  	add_column :users, :portfolio, :text
  end
end
