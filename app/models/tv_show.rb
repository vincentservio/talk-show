class TvShow < ApplicationRecord
    
      validates :title, uniqueness: true
end
