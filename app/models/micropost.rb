class Micropost < ActiveRecord::Base
  belongs_to :user
  validates :content, presence: true, length: { maximum: 140 }

  delegate :name, to: :user, prefix: :user
end
