class Micropost < ActiveRecord::Base
  # :user_id has been removed from attr_accessible to prevent manual modification

  attr_accessible :content, :user_id
  validates :user_id, presence: true
end
