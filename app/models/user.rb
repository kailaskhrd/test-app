class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :assignments
  has_many :roles, through: :assignments
  has_one :address, dependent: :destroy
  has_one_attached :profile_photo

  validates :name, :presence => true
  validates :email, :presence => true, :uniqueness => true, :format => { :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i }

  scope :all_users,   -> { includes(:roles).references(:roles).where("roles.name = 'user'") }
  accepts_nested_attributes_for :address

  def granted_rights_ids
    RolesRight.where(role: self.roles).granted.pluck(:right_id)
  end

  def granted_rights
    Right.where(id: granted_rights_ids)
  end

  def has_right?(right_name)
    granted_rights.where(name: right_name).present?
  end
end
