class Project < ApplicationRecord
  validates_presence_of :name
  has_many :members
  has_many :users, through: :members
  has_many :tasks
  has_many :histories
end
