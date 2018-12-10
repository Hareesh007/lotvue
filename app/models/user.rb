class User < ApplicationRecord
  scope :unassigned_users, -> {where(role_id: [])}
  scope :user_filter, -> (id){where("#{id} = ANY (role_id)")}

  def self.format_ids(ids)
   ids.join(',').split(',').map(&:to_i)
   ids.reject(&:blank?)
  end
end
