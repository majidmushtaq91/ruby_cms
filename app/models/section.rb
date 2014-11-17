class Section < ActiveRecord::Base
  has_many :section_edits

  scope :visible, lambda {where(:visible => true)}
  scope :invisible, lambda {where(:visible => false)}

  scope :sorted, lambda { order("sections.created_at ASC")}
  scope :newest_first, lambda { order("sections.created_at DESC")}

  scope :search, lambda {|query|

                 where (["name LIKE ?", "%#{query}%"])

               }
end
