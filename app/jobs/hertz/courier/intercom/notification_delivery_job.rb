# frozen_string_literal: true
module Hertz
  module Courier
    module Intercom
      class NotificationDeliveryJob < ActiveJob::Base
        queue_as :default

        def perform(notification)
        end
      end
    end
  end
end