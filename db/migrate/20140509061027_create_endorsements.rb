class CreateEndorsements < ActiveRecord::Migration
  def change
    create_table :endorsements do |t|
      t.belongs_to :skill, index: true
      t.belongs_to :endorser, index: true
      t.belongs_to :endorsee, index: true

      t.timestamps
    end
  end
end
