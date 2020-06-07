class RecordsController < ApplicationController
  
  def index
    # 当日日付を取得し検索用の文字列に変換する
    require 'date'
    t = Date.today
    search_date = t.strftime("%Y-%m-%d")
    # 当月の一覧を取得する
    @records = Record.where(run_day: search_date.in_time_zone.all_month).order(run_day: "ASC")
    # 当月の一覧より距離の集計値を求める
    @total_distance = @records.sum(:run_distance)
  end  
  
  def new
    @record = Record.new
  end
  
  def create
    @record = Record.new(record_params)
    if @record.save
      redirect_to records_path, notice:"登録できました"
    else
      # redirect_to new_record_path, notice:"入力エラー"
      render :new
    end  
  end 
  
  def edit
    @record = Record.find(params[:id])
  end
  
  def update
    record = Record.find(params[:id])
    record.update(update_params)
    redirect_to records_path, notice:"更新できました"
  end  
  
  def destroy
     record = Record.find(params[:id])
     record.destroy
     redirect_to records_path, notice:"削除できました"
  end   
  
   def show
    @record = Record.find(params[:id])
   end  
  
  
  private
  def record_params
    params.permit(:run_day, :run_title, :run_article, :run_distance, :run_time)
  end  
  
  def update_params
    params.require(:record).permit(:run_day, :run_title, :run_article, :run_distance, :run_time)
  end  

  
end
