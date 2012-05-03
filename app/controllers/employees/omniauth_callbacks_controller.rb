class Employees::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    employee = request.env["omniauth.auth"]["info"]
    return render text: "You must be logged into Google as a Tapjoy employee.", status: :unauthorized unless employee.email.ends_with? 'tapjoy.com'
    @employee = Employee.find_or_create_by_email(employee["email"].downcase)

    flash[:notice] = I18n.t "devise.omniauth_callbacks.success", kind: "Google"
    sign_in_and_redirect @employee, :event => :authentication
    session["devise.google_data"] = request.env["omniauth.auth"]
  end
end
