class Profile < ActiveRecord::Base
  attr_accessible :avatar, :name

  belongs_to :employee

  mount_uploader :avatar, AvatarUploader

  validates :avatar, presence: true
  validates :name, presence: true

  def to_s
    name
  end
end
