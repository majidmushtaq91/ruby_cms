class Page < ActiveRecord::Base
  validates_presence_of :name

  belongs_to :subject
  has_and_belongs_to_many :editors, :class_name => "AdminUser"
  has_and_belongs_to_many :widgets

  # Error handling
  #validates_presence_of :name

  scope :visible, lambda {where(:visible => true)}
  scope :invisible, lambda {where(:visible => false)}

  scope :sorted, lambda { order("pages.position ASC")}
  scope :newest_first, lambda { order("pages.created_at DESC")}
end
