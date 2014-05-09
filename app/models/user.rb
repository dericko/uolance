class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
         
  # Associations
  has_many :posts
  has_many :skills
  has_many :endorsements, through: :skills
  has_many :reviews, through: :posts

  # Validations
  validates :email, uniqueness: true

end
