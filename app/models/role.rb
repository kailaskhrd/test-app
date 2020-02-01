class Role < ApplicationRecord
  has_many :assignments
  has_many :users, through: :assignments

  has_many :roles_rights
  has_many :rights, through: :roles_rights

  validates :name, presence: true, uniqueness: true
end
