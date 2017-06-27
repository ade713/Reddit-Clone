class PostSub < ApplicationRecord
  validates :post, :sub, presence: true

  belongs_to :post,
    primary_key: :id,
    foreign_key: :post_id,
    class_name: :Post
    
  belongs_to :sub
end
