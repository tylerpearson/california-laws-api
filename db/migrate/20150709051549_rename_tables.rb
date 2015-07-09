class RenameTables < ActiveRecord::Migration
  def change
    rename_table :codes_tbl, :codes
    rename_table :law_section_tbl, :law_section
    rename_table :law_toc_sections_tbl, :law_toc_sections
    rename_table :law_toc_tbl, :law_toc
  end
end
