class Work < ApplicationRecord
    belongs_to :event
    
    mount_uploader :image_name, PortfolioImageUploader

    def event
        return Event.find_by(id: self.event_id)
    end
end
