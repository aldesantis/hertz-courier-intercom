# frozen_string_literal: true
module Hertz
  module Courier
    module Intercom
      RSpec.describe NotificationDeliveryJob do
        subject { described_class.new }

        it 'delivers the notification through Intercom'
      end
    end
  end
end
