class Skill < ActiveRecord::Base
  # Associations
  belongs_to :user
  has_many :endorsements

  # Validations
  validates_associated :user
end
