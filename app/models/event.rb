class Event < ApplicationRecord
    # アソシエーション
    has_many :comments, dependent: :destroy
    belongs_to :user

    def user
        return User.find_by(id: self.user_id)
    end
end
