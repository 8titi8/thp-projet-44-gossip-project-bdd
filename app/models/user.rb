class User < ApplicationRecord
  belongs_to :city
  has_many :gossips
  has_many :tags
  has_many :comments
  has_many :likes
  has_many :private_messages
end
