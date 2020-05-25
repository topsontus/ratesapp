class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true

  def error_message
    errors.full_messages.presence
  end
end
