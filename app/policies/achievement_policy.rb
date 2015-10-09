class AchievementPolicy < OwnedPolicy
  def update?
    false
  end

  def destroy?
    false
  end
end
