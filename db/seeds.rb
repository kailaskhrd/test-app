# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

roles = Role.create([{name: 'admin'}, {name: 'user'} ])

rights= Right.create([
                      {name: 'update self address'}, {name: 'update self phone number'},
                      {name: 'update all user addresses'}, {name: 'update self profile picture'},
                      {name: 'view users list'}
                    ])

# add admin rights
admin = Role.find_by(name: 'admin')
admin_rights = ['update self phone number', 'update all user addresses','view users list']

Right.where(name: admin_rights).each do |right|
  admin.roles_rights.create(right_id: right.id, status: RolesRight.statuses["granted"])
end

# add end user rights
end_user = Role.find_by(name: 'user')
end_user_rights = ['update self address', 'update self profile picture']
Right.where(name: end_user_rights).each do |right|
  end_user.roles_rights.create(right_id: right.id, status: RolesRight.statuses["granted"])
end

#create admin
admin_user = User.create!(name: 'name',email: 'admin@test.com', password: 'admin123', password_confirmation: 'admin123' )
admin_user.roles << Role.find_by(name: 'admin')

