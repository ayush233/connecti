class Comment < ApplicationRecord
	belongs_to :user
	belongs_to :post
	has_many :likes

	def user_can_like(user_id)
		if self.likes.find_by(user_id:user_id) != nil
			return false
		end

		return true

	end

	def like_status_string(user_id)
		if self.user_can_like(user_id)
			return 'Like'
		else
			return 'Unlike'

		end

	end
end
