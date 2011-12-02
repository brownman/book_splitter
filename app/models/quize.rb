class Quize < ActiveRecord::Base
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

