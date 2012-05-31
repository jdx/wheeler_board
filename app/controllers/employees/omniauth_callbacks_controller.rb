class Employees::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def tapjoy
    employee = request.env["omniauth.auth"]["info"]
    @employee = Employee.find_or_create_by_email(employee["email"].downcase)

    flash[:notice] = I18n.t "devise.omniauth_callbacks.success", kind: "Tapjoy"
    sign_in_and_redirect @employee, :event => :authentication
    finished('sign_up_text')
  end
end
