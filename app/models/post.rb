class Post < ActiveRecord::Base
  # Associations
  belongs_to :user
  has_many :skills

  # Validations
  validates :description, length: {within: 0..250}
  validates :title, length: {within: 0..40}
  validates_associated :user
end
