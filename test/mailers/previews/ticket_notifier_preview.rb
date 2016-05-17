# Preview all emails at http://localhost:3000/rails/mailers/ticket_notifier
class TicketNotifierPreview < ActionMailer::Preview

  # Preview this email at http://localhost:3000/rails/mailers/ticket_notifier/assigned
  def assigned
    TicketNotifier.assigned
  end

  # Preview this email at http://localhost:3000/rails/mailers/ticket_notifier/solved
  def solved
    TicketNotifier.solved
  end

end
