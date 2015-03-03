# personal_record.rb
# model for top scores of a user for a given exercise
class PersonalRecord < ActiveRecord::Base
  # Set up the associations for this exercise
  belongs_to :user
  belongs_to :exercise
end
