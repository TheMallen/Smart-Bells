# User.rb
# User model with some validation logic
# Based on User model from reference 1
# I have usernames AND emails because I plan to let users see eachother's achievments
# As a result I am happy to show them eachothers usernames but emails seems a little scummy.
# That being said I love when websites allow me to login with email or username so I have implemented that.
class User < ActiveRecord::Base

  # Can get achievments
  include Achiever

  # From Ruby on Rails Tutorial (reference 1)
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i

  # Automatically creates password, hashing and confirmation logic
  has_secure_password

  # Username must be there and be a reasonable length, unique
  validates :username,
    presence: true,
    length: { maximum: 20, minimum: 6 },
   uniqueness: { case_sensitive: false }

  # Email must be there and must be a reasonable length as well, unique
  validates :email,
     presence: true,
     length: { maximum: 255 },
     format: { with: VALID_EMAIL_REGEX },
     uniqueness: { case_sensitive: false }

  # Password needs to be an ok length
  validates :password, length: { minimum: 6 }

  # downcase the username and email so that typos aren't silly (and because emails should always be case insensitive)
  before_save do
    self.email = email.downcase
    self.username = username.downcase
  end

  # Set up associations for workouts
  has_many :workout_sessions
  has_many :personal_records
  has_many :routines

end
