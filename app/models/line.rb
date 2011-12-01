class Line < ActiveRecord::Base
  belongs_to :user
  has_ancestry
  validates :content, :presence => true, :length => { :maximum => 1000 }
  validates :user_id, :presence => true

end
