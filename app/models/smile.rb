class Smile < ActiveRecord::Base
  belongs_to :user


  validates :title, :presence => true, :length => { :minimum => 1 }
 # validates :rating, :presence => true
    #, :length => { :maximum => 1000 }
  validates :user_id, :presence => true
end

# == Schema Information
#
# Table name: smiles
#
#  id         :integer         not null, primary key
#  title      :string(255)
#  rating     :integer
#  created_at :datetime
#  updated_at :datetime
#  user_id    :integer
#

