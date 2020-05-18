class Comment < ApplicationRecord
    belongs_to :user
    belongs_to :tv_show
    validates :comment, length: { minimum: 2 }
     

end
