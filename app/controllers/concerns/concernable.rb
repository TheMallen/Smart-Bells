module Concernable
  extend ActiveSupport::Concern

  included do
    helper_method :say_hi
  end

  def say_hi
    "Hi!"
  end
end
