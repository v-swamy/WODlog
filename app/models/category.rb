class Category < ActiveRecord::Base
  include Sluggable

  belongs_to :creator, foreign_key: 'user_id', class_name: 'User'
  has_many :wod_categories
  has_many :wods, through: :wod_categories

  validates :name, presence: true
  validates_uniqueness_of :name, scope: :user_id

  sluggable_column :name

  def generate_slug!
    the_slug = to_slug(self.send(self.class.slug_column.to_sym))
    self.slug = the_slug.downcase
  end
end
