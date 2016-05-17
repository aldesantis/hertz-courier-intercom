class TestNotification < Hertz::Notification
  deliver_by :intercom

  def sms_body
    'Test Notification'
  end
end
