class Post < ActiveRecord::Base
  attr_accessible :content, :title, :user_id

  belongs_to :user

  validates :user_id , presence: true
  validates :title , presence: true ,
                     length: { maximum: 40 , minimum: 5 }
  validates :content , presence: true

  default_scope order: 'posts.created_at DESC'
end
