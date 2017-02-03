class Post < ApplicationRecord
  #validates :user_id, presence: true
  validates :title, presence: true, length: { maximum: 60 }
  validates :body, presence: true, length: { maximum: 200 }
end
