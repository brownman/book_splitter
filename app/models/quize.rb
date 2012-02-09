class Quize < ActiveRecord::Base
#  belongs_to :user
#belongs_to :quizable, :polymorphic => true
  belongs_to :quizable, :dependent => :destroy, :polymorphic => true


 # validates :compare_id, :presence => true

  validates :question, :presence => true, :length => {:minimum => 1}

  validates :quizable_type, :presence => true
  
  validates :quizable_id, :presence => true
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

