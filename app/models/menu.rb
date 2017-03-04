class Menu < ApplicationRecord
  validates_presence_of :name
  has_many :menu_items, dependent: :destroy
end
