class User < ApplicationRecord
  has_secure_password
  
  validates :name, presence: true 
  validates :email, presence: true
  validates :password_digest, presence: true
  
  has_one :member
  accepts_nested_attributes_for :member
 
  has_many :records
  has_many :targets
end
