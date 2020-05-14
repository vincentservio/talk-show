class TvShow < ApplicationRecord
  
  
    has_many :comments
    has_many :users, through: :comments
  scope :recent, -> { order('created_at desc') }
  scope :most_comments, -> { joins(:comments).group('tv_shows.id').order('COUNT(comment) DESC').limit(10) }
      validates :title, uniqueness: true
       validates :title, length: { minimum: 2 }
end
