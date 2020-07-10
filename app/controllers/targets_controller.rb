class TargetsController < ApplicationController
  def new
    @target = Target.new
  end  
  
  def create
    @target = current_user.targets.new(target_params)
    if @target.save
      redirect_to records_path, notice:"登録できました"
    else
      # redirect_to new_record_path, notice:"入力エラー"
      render :new
    end  
  end
  
  private
  def target_params
    # 当月を求める
    require 'date'
    t = Date.today
    ym= t.strftime("%Y%m")
    params.require(:target).permit(:target_declaration, :target_distance).merge(target_ym: ym)
  end  
end
