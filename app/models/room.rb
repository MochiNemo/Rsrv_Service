class Room < ApplicationRecord
    mount_uploader :room_image, RoomImageUploader
    
    validates :name,          presence: true, length: { maximum: 50 }
    validates :introduction,  presence: true, length: { maximum: 255 }
    validates :price,         presence: true
    validates :address,       presence: true, length: { maximum: 255 }
    validates :room_image,    presence: true
    
    belongs_to :user
    has_many :rsrvs

end
