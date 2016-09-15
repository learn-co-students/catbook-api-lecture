class Cat < ApplicationRecord
  validates :name, :weight, presence: true
  has_many :cat_hobbies
  has_many :hobbies, through: :cat_hobbies

  def fat?
    weight >= 10
  end

  def learn_to(hobby)
    self.hobbies << hobby
  end


end
