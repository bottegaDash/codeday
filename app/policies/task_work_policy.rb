class TaskWorkPolicy < ApplicationPolicy
  def edit?
    record.user_id != user.id
  end
end
