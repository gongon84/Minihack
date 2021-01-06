class Work < ApplicationRecord
    belongs_to :event

    def event
        return Event.find_by(id: self.event_id)
    end
end
