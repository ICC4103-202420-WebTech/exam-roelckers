class Compliment < ApplicationRecord
  belongs_to :user
  validates :message, presence: true, length: { maximum: 250 }
end
