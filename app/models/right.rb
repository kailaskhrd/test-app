class Right < ApplicationRecord
  validates :name, presence: true, uniqueness: true

  has_many :roles_rights
  has_many :roles, through: :roles_rights
end
