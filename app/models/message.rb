class Message < ActiveRecord::Base
belongs_to :user
  validates :line_id, :presence => true
 # , :length => { :maximum => 1000 }
  validates :user_id, :presence => true
end

# == Schema Information
#
# Table name: messages
#
#  id         :integer         not null, primary key
#  line_id    :integer
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

