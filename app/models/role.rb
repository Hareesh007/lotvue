class Role < ApplicationRecord
   scope :role_status, -> { where(status: true) }
   has_many :users
end
