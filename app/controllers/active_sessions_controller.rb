class ActiveSessionsController < ApplicationController
  before_action :authenticate_account!

  def destroy
    @active_session = current_account.active_sessions.find(params[:id])
    @active_session.destroy

    if current_account
      redirect_to account_path, notice: "Session deleted."
    else
      forget_active_session
      reset_session
      redirect_to root_path, notice: "Signed out."
    end
  end

  def destroy_all
    forget_active_session
    current_account.active_sessions.destroy_all
    reset_session

    redirect_to root_path, notice: "Signed out."
  end
end
