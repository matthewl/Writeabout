class PromptsController < ApplicationController
  rescue_from ActiveRecord::RecordInvalid, with: :not_found

  def show
    @prompt = Prompt.find_sole_by(public_id: params[:id])
  end

  private

  def not_found
    redirect_to not_found_path
  end
end