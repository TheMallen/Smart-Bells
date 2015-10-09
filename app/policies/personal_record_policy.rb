class PersonalRecordPolicy < OwnedPolicy
  def destroy?
    false
  end
end
