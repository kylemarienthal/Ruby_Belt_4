class Song < ActiveRecord::Base
  belongs_to :user, required: true
  has_many :playlists
  has_many :added_by, through: :playlists, source: :user

  validates :title, :artist, presence: true, length:{minimum: 2}
end
