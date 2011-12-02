class Smart < ActiveRecord::Base
  belongs_to :user

  validates :user_id, :presence => true
end

# == Schema Information
#
# Table name: smarts
#
#  id          :integer         not null, primary key
#  question    :string(255)
#  answer      :string(255)
#  created_at  :datetime
#  updated_at  :datetime
#  description :string(255)
#  maybe       :string(255)
#  grade       :integer
#  user_id     :integer
#

