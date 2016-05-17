class TicketNotifier < ApplicationMailer
  default from: 'OIA Ticketing <no_reply@oiaticketing.com>'

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.ticket_notifier.assigned.subject
  #
  def assigned(ticket)
    @ticket = ticket

    mail to: User.find_by(id: ticket.user_id)[:email], reply_to:'pdbriggs@unm.edu',subject: 'New ticket assigned'
  end

  # Subject can be set in your I18n file at config/locales/en.yml
  # with the following lookup:
  #
  #   en.ticket_notifier.solved.subject
  #
  def solved
    @greeting = "Hi"

    mail to: ticket.email, subject: 'Your ticket have been solved'
  end

  def create_ticket(ticket)
    @ticket = ticket
    @greeting = "Hi"

    mail to: @ticket.email, reply_to:'pdbriggs@unm.edu', cc:'shiva627@gmail.com',subject: 'Your ticket have been created'
  end

end
