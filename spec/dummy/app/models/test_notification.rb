class TestNotification < Hertz::Notification
  deliver_by :intercom

  def intercom_subject
    'Test Notification'
  end

  def intercom_body
    'This is a test notification!'
  end
end
