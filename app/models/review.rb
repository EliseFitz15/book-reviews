class Review < ActiveRecord::Base
  belongs_to :book
  
  validates :body, presence: true
  validates :rating, presence: true
  validates :rating, inclusion: { in: 0..100 }, numericality: { only_integer: true }
end
