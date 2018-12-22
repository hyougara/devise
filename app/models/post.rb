class Post < ApplicationRecord
  validates :title, presence: true, length:{maximum:140}
  validates :content, presence: true, length:{maximum:255}
  # belongs_to :user
  has_many :users, through: :favorites
  has_many :favorites

  # 他のモデルを一括で更新保存を行う ここではpostをしたら一緒にpost_idも保存される
  accepts_nested_attributes_for :favorites
  enum status:{draft: 0, working: 1, published: 2}
  enum priority:{low: 0, midium: 1, high: 2}
  acts_as_taggable   # acts_as_taggable_on :tagsのエイリアス

end

# SELECT  1 AS one FROM "posts" WHERE "posts"."user_id" = 6 AND "posts"."title" LIKE '%e%' ORDER BY"posts"."status" DESC LIMIT 20 OFFSET 0