class User < ApplicationRecord
  has_one :profile
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def admin?
    is_admin
  end

  validates :name, :presence => false, :uniqueness => true
  validates :age, numericality: { only_integer: true }
end
