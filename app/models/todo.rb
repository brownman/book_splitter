class Todo < ActiveRecord::Base
  belongs_to :user

  validates :user_id, :presence => true
end

# == Schema Information
#
# Table name: todos
#
#  id         :integer         not null, primary key
#  action     :string(255)
#  target     :string(255)
#  conclusion :string(255)
#  created_at :datetime
#  updated_at :datetime
#  user_id    :integer
#  priority   :integer
#

