class User < ApplicationRecord

	has_secure_password

	validates_presence_of :email
	validates_uniqueness_of :email, case_sensitive: false
	validates_format_of :email, with: /@/

    has_many :user_events, dependent: :destroy
	has_many :events, dependent: :destroy
	has_many :comments, dependent: :destroy

	mount_uploader :image, ImageUploader
    
end
