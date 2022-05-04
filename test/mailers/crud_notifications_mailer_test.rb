require "test_helper"

class CrudNotificationsMailerTest < ActionMailer::TestCase
  test "create_notifications" do
    mail = CrudNotificationsMailer.create_notifications
    assert_equal "Create notifications", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "update_notifications" do
    mail = CrudNotificationsMailer.update_notifications
    assert_equal "Update notifications", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "delete_notifications" do
    mail = CrudNotificationsMailer.delete_notifications
    assert_equal "Delete notifications", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
