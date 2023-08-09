class ApplicationController < ActionController::Base
  include SessionsHelper
  before_action :login_required
  before_action :login_owner, only: [:edit]

  private

  def login_required
    redirect_to new_session_path unless current_user
  end

  def login_owner
    user = User.find(params[:id])
    if current_user != user
    redirect_to user_path(current_user), alert: "他のユーザーの情報を編集する権限がありません"
    end
  end
end
