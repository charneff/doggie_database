class Owner < ActiveRecord::Base
  has_many :dogs

  has_secure_password

  validates :email, :presence => true
  validates :owner_name, :presence => true
end
