class Code < ActiveRecord::Base
  self.primary_key = 'code'

  default_scope { order('code ASC') }

  has_many :sections, foreign_key: :law_code

  def formatted_title
    title.split(' - ').first
  end

end

# == Schema Information
#
# Table name: codes
#
#  code  :string(5)        primary key
#  title :string(2000)
#
