class AdminUser < ActiveRecord::Base

  #To configure table name if we've changed !
  #self.table_name = "admin_users"

  #short way
  # attr_accessor :first_name
  #
  # #Long way
  # def last_name
  #   @last_name
  # end
  #
  # def last_name=(value)
  #   @last_name = value
  # end
  has_and_belongs_to_many :pages
  has_many :section_edits
end
