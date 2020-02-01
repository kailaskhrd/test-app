class RolesRight < ApplicationRecord
  belongs_to :role
  belongs_to :right

  enum status:["revoked","granted"]
end
