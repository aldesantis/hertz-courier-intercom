class User < ActiveRecord::Base
  include Hertz::Notifiable

  def hertz_intercom_email
    'jdoe@example.com'
  end
end
