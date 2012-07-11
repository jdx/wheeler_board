class WheelerMailer < ActionMailer::Base
  default from: "noreply@tapjoy.com"

  def notify(wheeler)
    @wheeler = wheeler
    mail(from: wheeler.reporter.employee.email, to: 'dev@tapjoy.com', :subject => "#{wheeler.profile} just wheelered!")
  end
end
