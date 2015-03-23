##
# Nameable.rb
# By Mathew Allen
# A concern for anything which can be named
# Helps keep things DRY :)
##
module Nameable
  extend ActiveSupport::Concern

  included do
    before_save :titleize_name

    validates :name,
      presence: true,
      length: { maximum: 20, minimum: 3 },
      uniqueness: { case_sensitive: false }
  end

  def titleize_name
    self.name = name.titleize
  end
end
