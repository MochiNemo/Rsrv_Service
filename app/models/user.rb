class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  mount_uploader :image_name, ImageNameUploader
  
  validates :name,          presence: true, length: { maximum: 50 }
  
  with_options on: :update do
    validates :introduction,  presence: true, length: { maximum: 255 }
    validates :image_name,    presence: true
  end
  

end
