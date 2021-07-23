class Work < ApplicationRecord
    belongs_to :event
    
    mount_uploader :image_name, PortfolioImageUploader

    def event
        return Event.find_by(id: self.event_id)
    end

    # いいねカウントをするため
    ransacker :likes_count do
        query = '(SELECT COUNT(likes.work_id) FROM likes where likes.work_id = works.id GROUP BY likes.work_id)'
        Arel.sql(query)
    end
end
