class Cat < ApplicationRecord
  has_many :cat_hobbies
  has_many :hobbies, through: :cat_hobbies

  validates :name, presence: true
  validates :weight, presence: true

  def fat?
    weight >= 10
  end

  def learn_to(hobby)
    self.hobbies << hobby
  end
end
