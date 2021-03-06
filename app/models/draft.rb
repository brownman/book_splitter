class Draft < ActiveRecord::Base
  belongs_to :compare
  default_scope :order => 'drafts.id ASC'
  validates :title, :presence => true, :length => {:minimum => 1}
end

# == Schema Information
#
# Table name: drafts
#
#  id         :integer         not null, primary key
#  content    :text
#  title      :string(255)
#  created_at :datetime
#  updated_at :datetime
#  compare_id :integer
#

