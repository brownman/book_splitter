class Draft < ActiveRecord::Base
  belongs_to :compare
  default_scope :order => 'drafts.id ASC'
end
