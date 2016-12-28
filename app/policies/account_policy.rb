class AccountPolicy < ApplicationPolicy
  def index?
    user.try(:admin?)
  end

  def orders?
    user.try(:admin?) || record.try(:user) == user
  end
end