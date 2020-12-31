class Event < ApplicationRecord
    # アソシエーション
    has_many :comments, dependent: :destroy
end
