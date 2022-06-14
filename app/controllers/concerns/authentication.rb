module Authentication
  extend ActiveSupport::Concern

  included do
    before_action :current_account
    helper_method :current_account
    helper_method :account_signed_in?
  end

  def authenticate_account!
    store_location
    redirect_to login_path, alert: "You need to login to access that page." unless account_signed_in?
  end

  def login(account)
    reset_session
    active_session = account.active_sessions.create!(user_agent: request.user_agent, ip_address: request.ip)
    session[:current_active_session_id] = active_session.id

    active_session
  end

  def logout
    active_session = ActiveSession.find_by(id: session[:current_active_session_id])
    reset_session
    active_session.destroy! if active_session.present?
  end

  def forget_active_session
    cookies.delete :remember_token
  end

  def remember(active_session)
    cookies.permanent.encrypted[:remember_token] = active_session.remember_token
  end

  def redirect_if_authenticated
    redirect_to admin_index_path, alert: "You are already logged in." if account_signed_in?
  end

  private

  def current_account
    Current.account = if session[:current_active_session_id].present?
      ActiveSession.find_by(id: session[:current_active_session_id])&.account
    elsif cookies.permanent.encrypted[:remember_token].present?
      ActiveSession.find_by(remember_token: cookies.permanent.encrypted[:remember_token])&.account
    end
  end

  def account_signed_in?
    Current.account.present?
  end

  def store_location
    session[:account_return_to] = request.original_url if request.get? && request.local?
  end
end