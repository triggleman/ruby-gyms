class Favorite < ApplicationRecord
  belongs_to :user

  validates :name, presence: true
  validates :formatted_address, presence: true
  validates :geometry, presence: true
  validates :rating, presence: true
  validates :user_id, presence: true

end
