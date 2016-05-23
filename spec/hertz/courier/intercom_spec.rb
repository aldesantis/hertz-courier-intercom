# frozen_string_literal: true
module Hertz
  module Courier
    RSpec.describe Intercom do
      describe '.configure' do
        it 'changes the configuration options' do
          expect {
            described_class.configure do |config|
              config.intercom_app_id = 'TestAppID'
            end
          }.to change(described_class, :intercom_app_id).to('TestAppID')
        end
      end

      describe '.deliver_notification' do
        let(:notification) { build_stubbed(:test_notification) }

        it 'schedules the delivery' do
          expect {
            described_class.deliver_notification(notification)
          }.to enqueue_a(described_class::NotificationDeliveryJob)
            .with(global_id(notification))
        end
      end
    end
  end
end
