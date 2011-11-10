class Smart < ActiveRecord::Base
  belongs_to :user

  validates :user_id, :presence => true
end
