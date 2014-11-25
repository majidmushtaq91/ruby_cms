class Section < ActiveRecord::Base
  has_many :section_edits
  belongs_to :page

  CONTENT_TYPE = ['HTML', 'TEXT']

  validates_presence_of :name, :message => 'Please enter name !'
  validates_length_of :content, :minimum => 10, :maximum => 250
  validates_uniqueness_of :position
  validates_inclusion_of :content_type, :in => CONTENT_TYPE, :message => "Must be one of : #{CONTENT_TYPE.join(', ')}"
  validates_presence_of :content, :class => "erorr"



  scope :visible, lambda {where(:visible => true)}
  scope :invisible, lambda {where(:visible => false)}

  scope :sorted, lambda { order("sections.created_at ASC")}
  scope :newest_first, lambda { order("sections.created_at DESC")}

  scope :search, lambda {|query|

                 where (["name LIKE ?", "%#{query}%"])

               }
end
