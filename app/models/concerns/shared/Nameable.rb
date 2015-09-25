##
# Nameable.rb
# By Mathew Allen
# A concern for anything which can be named
# Helps keep things DRY :)
##
module Shared::Nameable
  extend ActiveSupport::Concern

  # Callback for when the mixin is included
  included do
    before_save :titleize_name

    validates :name,
      presence: true,
      length: { maximum: 20, minimum: 3 },
      uniqueness: { case_sensitive: false }
  end

  # titleize's the name attribute
  def titleize_name
    self.name = name.titleize
  end
end
