class Review < ActiveRecord::Base
  # Associations
  belongs_to :post
  belongs_to :reviewer, :class_name => "User"
  belongs_to :reviewee, :class_name => "User"

  # Validations
  validates :review, length: {within: 0..500}
  validates :title, length: {within: 0..40}
  validates_associated :post
  validates_associated :reviewer
  validates_associated :reviewee
end
