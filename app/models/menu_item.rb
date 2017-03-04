class MenuItem < ApplicationRecord
  belongs_to :menu
  validates_presence_of :name, :description, :price
  validates_uniqueness_of :name, scope: :menu
end
