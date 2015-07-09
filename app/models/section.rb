class Section < ActiveRecord::Base
  self.primary_key = 'id'
  self.table_name = 'law_section'

  default_scope { order('id ASC') }

  belongs_to :code, foreign_key: :law_code

  def content
    content_xml.gsub(/<.+?>/, '')
  end

end
