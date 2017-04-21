class Secret < ActiveRecord::Base
  belongs_to :user
  has_many :likes
  has_many :secret_like1, through: :likes, source: :user

  validates :content, presence: true
end
