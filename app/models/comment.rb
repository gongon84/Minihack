class Comment < ApplicationRecord
    # アソシエーション
    belongs_to :event
end
