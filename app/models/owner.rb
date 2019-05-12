class Owner < ActiveRecord::Base
  has_many :dogs

  has_secure_password

  validates :email, :presence => true
end
