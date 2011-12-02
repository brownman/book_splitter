class Idea < ActiveRecord::Base

  attr_accessible :content
  belongs_to :user

  
  validates :content, :presence => true, :length => { :maximum => 1000 }
  validates :user_id, :presence => true
end

# == Schema Information
#
# Table name: ideas
#
#  id         :integer         not null, primary key
#  title      :string(255)
#  content    :text
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

