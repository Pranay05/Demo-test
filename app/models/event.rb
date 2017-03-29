class Event < ApplicationRecord
 belongs_to :user
 has_many :comments, dependent: :destroy
 has_many :user_events, dependent: :destroy
 has_many :users, through: :user_events
 has_many :likes, as: :likable

#carrierwave
 mount_uploader :image, ImageUploader

 geocoded_by :location
 after_validation :geocode, :if => :location_changed?

end
