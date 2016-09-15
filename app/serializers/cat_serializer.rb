class CatSerializer < ActiveModel::Serializer
  attributes :id, :name, :breed, :temperament, :weight, :fat?
  has_many :hobbies
end
