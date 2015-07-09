class CodeSerializer < ActiveModel::Serializer
  attributes :title, :id

  def id
    object.code
  end

  def title
    object.formatted_title
  end

end
