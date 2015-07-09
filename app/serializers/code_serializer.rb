class CodeSerializer < ActiveModel::Serializer
  attributes :title, :id

  def id
    object.code
  end

  def title
    object.formatted_title
  end

end

# == Schema Information
#
# Table name: codes
#
#  code  :string(5)        primary key
#  title :string(2000)
#
