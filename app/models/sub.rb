class Sub < ApplicationRecord
  validates :title, :description, :mod, presence: true

  belongs_to :mod,
    primary_key: :id,
    foreign_key: :mod_id,
    class_name: :User

  has_many :post_subs,
    primary_key: :id,
    foreign_key: :sub_id,
    class_name: :PostSub

  has_many :posts, through: :post_subs, source: :post
end
