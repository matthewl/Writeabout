class SessionsController < ApplicationController
  before_action :redirect_if_authenticated, only: [:create, :new]

  def create
    @account = Account.authenticate_by(email: params[:account][:email].downcase, password: params[:account][:password])
    if @account
      after_login_path = session[:account_return_to] || root_path
      active_session = login @account
      remember(active_session) if params[:account][:remember_me] == "1"
      redirect_to after_login_path, notice: "Signed in."
    else
      flash.now[:alert] = "Incorrect email or password."
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    forget_active_session
    logout
    redirect_to root_path, notice: "Signed out."
  end

  def new
  end
end
