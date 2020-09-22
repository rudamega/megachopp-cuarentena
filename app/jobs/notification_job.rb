class NotificationJob < ApplicationJob
  queue_as :default

  def perform(cliente)
    # Do something later
  end
end
