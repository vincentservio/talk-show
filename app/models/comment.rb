class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :tv_show
    validates :comment, length: { minimum: 2 }
     def created
        self.created_at.strftime("%m-%e-%y %H:%M")
    end

end
