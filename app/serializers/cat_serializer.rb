class CatSerializer < ActiveModel::Serializer
  attributes :id, :name, :breed, :temperament, :weight
  # :fat?
  has_many :hobbies


  def my_special_attribute
    # cat.first_name + cat.last_name
  end
end
