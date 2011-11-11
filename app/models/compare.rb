class Compare < ActiveRecord::Base
  belongs_to :user

  has_many :drafts
  has_many :quizes
  
  validates :user_id, :presence => true
  
end
