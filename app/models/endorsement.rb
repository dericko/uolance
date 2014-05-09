class Endorsement < ActiveRecord::Base
  # Associations
  belongs_to :skill
  belongs_to :endorser, :class_name => "User"
  belongs_to :endorsee, :class_name => "User"

  # Validations
  validates_associated :skill
  validates_associated :endorser
  validates_associated :endorsee
end
