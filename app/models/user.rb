class User < ActiveRecord::Base
  include Sluggable

  has_many :wods
  has_many :categories

  has_secure_password

  validates :username, presence: true, uniqueness: true
  validates :email, presence: true, uniqueness: true
  validates :phone, presence: true, length: {minimum: 10}

  sluggable_column :username
end
