class Post < ApplicationRecord
  validates :title, presence: true, length:{maximum:140}
  validates :content, presence: true, length:{maximum:255}
  belongs_to :user
  enum status:{draft: 0, working: 1, published: 2}
  enum priority:{low: 0, midium: 1, high: 2}
end
