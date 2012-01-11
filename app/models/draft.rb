class Draft < ActiveRecord::Base
  belongs_to :compare
  default_scope :order => 'drafts.id ASC'
  validates :title, :presence => true, :length => {:minimum => 1}

  def replace_string 
    compare  = Compare.find_by_id self.compare_id
    user_id   = compare.user_id   
    user = User.find_by_id(user_id)

    str_res = self.content.clone  #duplicate the text

    user.hunters.each do |hunter| 

      line = ''
      line <<   hunter.regexp.to_s
      begin  

        regexp =     Regexp.new hunter.regexp
        if regexp
          #   result = regexp.match str
          #str_res.gsub!(regexp)
          str_res.gsub!(regexp, '<b><mark>\1</mark></b>')             #=> "h<e>ll<o>"
        end
      rescue Exception => e  
        puts e.message  
        puts e.backtrace.inspect  

        line <<  e.message

      end  

    end
    str_res
  end

  def hunter_result 

    #, str #=draft.content
    regexp_result = []
    str = self.content

    compare  = Compare.find_by_id self.compare_id
    user_id   = compare.user_id   
    user = User.find_by_id(user_id)


    user.hunters.each do |hunter| 

      line = ''
      line <<   hunter.regexp.to_s

      begin  

        regexp =     Regexp.new hunter.regexp
        if regexp
          result = regexp.match str

          line <<  " -> " + result.to_s

        end
      rescue Exception => e  
        puts e.message  
        puts e.backtrace.inspect  

        line <<  e.message

      end  

      regexp_result.push line 



    end

    regexp_result
  end
end

# == Schema Information
#
# Table name: drafts
#
#  id         :integer         not null, primary key
#  content    :text
#  title      :string(255)
#  created_at :datetime
#  updated_at :datetime
#  compare_id :integer
#

