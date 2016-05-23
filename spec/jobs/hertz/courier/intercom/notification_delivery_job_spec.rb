# frozen_string_literal: true
module Hertz
  module Courier
    module Intercom
      RSpec.describe NotificationDeliveryJob do
        let(:notification) { build_stubbed(:test_notification) }

        subject { described_class.new }

        let(:intercom_client) { instance_double('Intercom::Client') }
        let(:intercom_messages) do
          instance_double('Intercom::Service::Message')
        end

        before(:each) do
          allow(::Intercom::Client).to receive(:new)
            .and_return(intercom_client)

          allow(intercom_client).to receive(:messages)
            .and_return(intercom_messages)
        end

        it 'delivers the notification through Intercom' do
          expect(intercom_messages).to receive(:create)
            .once

          subject.perform(notification)
        end

        context 'when the receiver does not have an Intercom ID' do
          before(:each) do
            allow(notification.receiver).to receive(:hertz_intercom_id)
              .and_return(false)
          end

          it 'does not deliver the notification through Intercom' do
            expect(intercom_messages).not_to receive(:create)
            subject.perform(notification)
          end
        end
      end
    end
  end
end
