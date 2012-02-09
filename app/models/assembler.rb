class Assembler < ActiveRecord::Base
belongs_to :user
has_many :quizes, :as => :quizable

    validates :chapter, :presence => true, :length => {:minimum => 1}

  validates :user_id, :presence => true
end
