class TvShow < ApplicationRecord
  belongs_to :user
    has_many :comments
    has_many :users, through: :comments

      validates :title, uniqueness: true
end
