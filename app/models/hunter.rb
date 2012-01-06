class Hunter < ActiveRecord::Base
  belongs_to :user

  validates :user_id, :presence => true

  validates :regexp, :presence => true, :length => { :minimum => 1 }


end
