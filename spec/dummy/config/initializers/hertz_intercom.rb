# frozen_string_literal: true
Hertz::Courier::Intercom.configure do |config|
  # Your Intercom app ID.
  config.intercom_app_id = 'YourAppID'

  # Your Intercom API key.
  config.intercom_api_key = 'YourAPIKey'

  # The template to use for emails ("plain" or "personal").
  config.email_template = 'plain'

  # The initiator's ID in Intercom.
  config.admin_id = '12345'
end
