require 'test_helper'

class TicketNotifierTest < ActionMailer::TestCase
  test "assigned" do
    mail = TicketNotifier.assigned
    assert_equal "Assigned", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

  test "solved" do
    mail = TicketNotifier.solved
    assert_equal "Solved", mail.subject
    assert_equal ["to@example.org"], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match "Hi", mail.body.encoded
  end

end
