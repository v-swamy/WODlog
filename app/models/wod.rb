class Wod < ActiveRecord::Base
  include Sluggable

  belongs_to :creator, foreign_key: 'user_id', class_name: 'User'
  has_many :wod_categories
  has_many :categories, through: :wod_categories

  sluggable_column :created_at


  def to_slug(name)
    name = name.strftime("%m/%d/%Y %l:%M%P")
    super
  end
end