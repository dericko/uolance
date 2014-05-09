class CreateReviews < ActiveRecord::Migration
  def change
    create_table :reviews do |t|
      t.belongs_to :post, index: true
      t.belongs_to :reviewer, index: true
      t.belongs_to :reviewee, index: true
      t.string :title
      t.text :text
      t.integer :rating

      t.timestamps
    end
  end
end
