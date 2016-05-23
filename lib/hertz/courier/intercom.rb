# frozen_string_literal: true
require 'intercom'
require 'hertz'

require 'hertz/courier/intercom/engine'
require 'hertz/courier/intercom/version'

module Hertz
  module Courier
    module Intercom
      mattr_accessor(
        :intercom_api_key, :intercom_app_id, :email_template, :admin_id
      )

      class << self
        def configure
          yield(self)
        end

        def deliver_notification(notification)
          Hertz::Courier::Intercom::NotificationDeliveryJob
            .perform_later(notification)
        end
      end
    end
  end
end
