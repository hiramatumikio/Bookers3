class Book < ApplicationRecord
  belongs_to :user
  validates :title, presence: true
  validates :body, length: { maximum: 51 }
  validates :body, presence: true
end
