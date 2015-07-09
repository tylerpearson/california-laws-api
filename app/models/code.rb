class Code < ActiveRecord::Base
  self.primary_key = 'code'

  default_scope { order('code ASC') }

  has_many :sections, foreign_key: :law_code

  def formatted_title
    title.split(' - ').first
  end

end
