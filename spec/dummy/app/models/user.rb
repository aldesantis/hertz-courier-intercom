class User < ActiveRecord::Base
  include Hertz::Notifiable

  def hertz_intercom_id
    1
  end
end
