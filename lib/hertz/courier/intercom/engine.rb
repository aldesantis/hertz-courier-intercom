# frozen_string_literal: true
module Hertz
  module Courier
    module Intercom
      class Engine < ::Rails::Engine
        isolate_namespace Hertz::Courier::Intercom
      end
    end
  end
end
