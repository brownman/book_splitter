class Compare < ActiveRecord::Base
  belongs_to :user

  has_many :drafts
  has_many :quizes
  
  validates :user_id, :presence => true
  
end

# == Schema Information
#
# Table name: compares
#
#  id         :integer         not null, primary key
#  title      :string(255)
#  created_at :datetime
#  updated_at :datetime
#  user_id    :integer
#  note       :text
#

