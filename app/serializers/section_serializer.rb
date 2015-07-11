class SectionSerializer < ActiveModel::Serializer
  attributes :id, :code, :section, :op_statues, :op_chapter, :op_section, :effective_date,
    :law_section_version_id, :division, :title, :part, :chapter, :article, :history,
    :content, :active

  def op_statues
    object.op_statues
  end

  def op_chapter
    object.op_chapter.to_f
  end

  def op_section
    object.op_section.to_f
  end

  def code
    object.law_code
  end

  def section
    object.section_num
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
