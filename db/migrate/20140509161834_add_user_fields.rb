class AddUserFields < ActiveRecord::Migration
  def change
  	  # Added fields
  	  add_column :users, :first_name, :string
  	  add_column :users, :last_name, :string
  	  add_column :users, :year, :string
  	  add_column :users, :phone, :string
  	  add_column :users, :is_org, :boolean
  	  add_column :users, :org_name, :string


  	  add_reference :users, :posts
  	  add_reference :users, :reviews
  	  add_reference :users, :skills
  	  add_reference :users, :endorsements
  end
end
