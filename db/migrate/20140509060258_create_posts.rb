class CreatePosts < ActiveRecord::Migration
  def change
    create_table :posts do |t|
      t.belongs_to :user, index: true
      t.string :category
      t.string :date
      t.string :title
      t.string :description

      t.timestamps
    end
  end
end
