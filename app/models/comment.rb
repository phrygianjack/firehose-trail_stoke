class Comment < ApplicationRecord
	validates :message, presence: true
	validates :user_id, presence: true
	validates :gram_id, presence: true
	belongs_to :user
end
