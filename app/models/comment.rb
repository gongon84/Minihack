class Comment < ApplicationRecord
    # アソシエーション
    belongs_to :user, optional: true #null値を許可
    belongs_to :event
end
