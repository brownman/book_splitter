class Message < ActiveRecord::Base
belongs_to :user
  validates :line_id, :presence => true
 # , :length => { :maximum => 1000 }
  validates :user_id, :presence => true
end
