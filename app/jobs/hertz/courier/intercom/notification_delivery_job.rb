# frozen_string_literal: true
module Hertz
  module Courier
    module Intercom
      class NotificationDeliveryJob < ActiveJob::Base
        queue_as :default

        def perform(notification)
          return unless notification.receiver.hertz_intercom_email.present?

          intercom_client.messages.create(
            message_type: 'email',
            subject: notification.intercom_subject,
            body: notification.intercom_body,
            template: ::Hertz::Courier::Intercom.email_template,
            from: {
              type: 'admin',
              id: ::Hertz::Courier::Intercom.admin_id
            },
            to: {
              type: 'user',
              email: notification.receiver.hertz_intercom_email
            }
          )
        end

        private

        def intercom_client
          @intercom ||= ::Intercom::Client.new(
            app_id: ::Hertz::Courier::Intercom.intercom_app_id,
            api_key: ::Hertz::Courier::Intercom.intercom_api_key
          )
        end
      end
    end
  end
end
