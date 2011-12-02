class Line < ActiveRecord::Base
  belongs_to :user
  has_ancestry
  validates :content, :presence => true, :length => { :maximum => 1000 }
  validates :user_id, :presence => true

end

# == Schema Information
#
# Table name: lines
#
#  id         :integer         not null, primary key
#  content    :string(255)
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#  ancestry   :string(255)
#  parent_id  :integer
#

