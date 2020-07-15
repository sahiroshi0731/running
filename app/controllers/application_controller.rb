class ApplicationController < ActionController::Base
  helper_method :current_user
  before_action :login_required
  
  private
  # カレントユーザーの判定
  def current_user
    @current_user || User.find_by(id: session[:user_id]) if session[:user_id]
  end  
  
  # カレントユーザーでない場合、ログイン先へ遷移
  def login_required
    redirect_to login_url unless current_user
  end  
  # 当日日付を取得
  def today_get
    require 'date'
    return Date.today
  end  
end
