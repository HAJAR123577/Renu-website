class Utilisateur < ApplicationRecord
    has_secure_password
     has_many :annonces, foreign_key: 'utilisateur_id'
     
  
    VALID_EMAIL = /\A[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}\z/i
  
    validates :nom, presence: true, length: { maximum: 50 }
    validates :email, presence: true, length: { maximum: 255 },
                      format: { with: VALID_EMAIL },
                      uniqueness: { case_sensitive: false }
    validates :password, presence: true, length: { minimum: 6 }
  end
  