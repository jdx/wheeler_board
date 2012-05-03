class Employee < ActiveRecord::Base
  attr_accessible :email, :password, :password_confirmation, :remember_me

  devise :database_authenticatable, :recoverable, :rememberable, :trackable, :validatable, :omniauthable

  has_one :profile

  def to_s
    profile ? profile.name : email
  end
end
