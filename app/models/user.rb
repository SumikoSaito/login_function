class User < ApplicationRecord
  mount_uploader :image, ImageUploader
  validates :name,  presence: true, length: { maximum: 30 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i }
  before_validation { email.downcase! }
  has_secure_password
  validates :password, presence: true, length: { minimum: 6 }
  has_many :favorites, dependent: :destroy
  has_many :blogs

#  def self.new_remember_token
#      SecureRandom.urlsafe_base64
#    end
#
#    def self.encrypt(token)
#      Digest::SHA256.hexdigest(token.to_s)
#    end
end
