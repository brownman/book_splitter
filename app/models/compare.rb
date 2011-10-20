class Compare < ActiveRecord::Base
  belongs_to :user
  has_many :drafts
  validates :user_id, :presence => true
end
