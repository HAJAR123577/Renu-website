class Category < ApplicationRecord
    
    validates :nom, presence: true, uniqueness: true
  end