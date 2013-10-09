class AddAttributesToProjects < ActiveRecord::Migration
  def change

  	add_column :projects, :location, :string
  	add_column :projects, :start_time, :datetime
  	add_column :projects, :end_time, :datetime
  	add_column :projects, :avatar, :string
  	add_column :projects, :ongoing, :boolean, default: true

  end
end
