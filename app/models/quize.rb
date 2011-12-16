class Quize < ActiveRecord::Base
  belongs_to :compare

  validates :compare_id, :presence => true

  validates :question, :presence => true, :length => {:minimum => 1}
end

# == Schema Information
#
# Table name: quizes
#
#  id         :integer         not null, primary key
#  question   :string(255)
#  answer     :string(255)
#  created_at :datetime
#  updated_at :datetime
#  compare_id :integer
#

