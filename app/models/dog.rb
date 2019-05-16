class Dog < ActiveRecord::Base
  belongs_to :owner

  validates :name, :presence => true
  validates :breed, :presence => true
  validates :age, :presence => true
  validates :gender, :presence => true
end
