class Section < ActiveRecord::Base
  self.primary_key = 'id'
  self.table_name = 'law_section'

  default_scope { order('id ASC') }
  scope :code, -> (code) { where law_code: code.upcase }
  scope :division, -> (division) { where division: check_ending_dot(division) }
  scope :chapter, -> (chapter) { where chapter: check_ending_dot(chapter) }
  scope :article, -> (article) { where article: check_ending_dot(article) }

  belongs_to :code, foreign_key: :law_code

  def content
    content_xml.gsub(/<.+?>/, ' ').squish
  end

  def active
    active_flg == "Y"
  end

  def code
    law_code
  end

  private

    def self.check_ending_dot(check)
      check = check.to_s
      if check[-1,1] != "."
        return "#{check}."
      end
      check
    end

end

# == Schema Information
#
# Table name: law_section
#
#  id                     :string(100)      primary key
#  law_code               :string(5)
#  section_num            :string(30)
#  op_statues             :string(10)
#  op_chapter             :string(10)
#  op_section             :string(20)
#  effective_date         :datetime
#  law_section_version_id :string(100)
#  division               :string(100)
#  title                  :string(100)
#  part                   :string(100)
#  chapter                :string(100)
#  article                :string(100)
#  history                :string(1000)
#  content_xml            :text(4294967295)
#  active_flg             :string(1)        default("Y")
#  trans_uid              :string(30)
#  trans_update           :datetime
#
# Indexes
#
#  law_section_code_idx  (law_code)
#  law_section_id_idx    (law_section_version_id)
#  law_section_sect_idx  (section_num)
#  law_section_tbl_pk    (id)
#
