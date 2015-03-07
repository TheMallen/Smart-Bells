module Nameable
  extend ActiveSupport::Concern

  included do
    before_save :titleize_name

    validates :name,
      presence: true,
      length: { maximum: 20, minimum: 6 },
      uniqueness: { case_sensitive: false }
  end

  def titleize_name
    self.name = name.titleize
  end
end
