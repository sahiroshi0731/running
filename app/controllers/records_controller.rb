class RecordsController < ApplicationController
  
  def index
    # 当日日付を取得し検索用の文字列に変換する
    require 'date'
    t = Date.today
    search_date = t.strftime("%Y-%m-%d")
    search_date2 = t.strftime("%Y%m")
    # メンバー情報を取得する
    @member = current_user.member
    # 当月の一覧を取得する
    # @recordall = current_user.records
    @records = current_user.records.where(run_day: search_date.in_time_zone.all_month).order(run_day: "ASC")
    # 当月の一覧より距離の集計値を求める
    @total_distance = @records.sum(:run_distance)

    # 月分の集計を行う
    # カレントユーザのレコードのみ取得
    @records2 =  current_user.records
    # 年月単位で集計
    @d = @records2.group("DATE_FORMAT(run_day, '%Y%m')").select("DATE_FORMAT(run_day, '%Y%m') as month, count(id) as cnt")
    
    # 目標の表示のための検索
    @target = current_user.targets.find_by(target_ym: search_date2)
    @total_distance2 = @target.target_distance - @total_distance unless @target == nil
    @ym = nil
  end  
  
  # 月別アーカイブ
  def archives
    # パラメータを文字列に型変換する 
    x = params[:yyyymm]
    x2 = x.to_s + '01'
    ym = x.to_s
    @ym = ym.slice(0..3) +"年" + ym.slice(4..5) + "月" 
    # 文字列を日付に型変換する 
    t = x2.to_date
    search_date = t.strftime("%Y-%m-%d")
    # 当月の一覧を取得する
    @records = current_user.records.where(run_day: search_date.in_time_zone.all_month).order(run_day: "ASC")
    # 当月の一覧より距離の集計値を求める
    @total_distance = @records.sum(:run_distance)

     # 月分の集計を行う
    # カレントユーザのレコードのみ取得
    @records2 =  current_user.records
    # 年月単位で集計
    @d = @records2.group("DATE_FORMAT(run_day, '%Y%m')").select("DATE_FORMAT(run_day, '%Y%m') as month, count(id) as cnt")
  end  
  
  # ?????
  # def member
  #   @user = find(current_user_id)
  # end  
    
  
  def new
    @record = Record.new
  end
  
  def create
    # 大会チェックボックスを入れた場合、距離種目の判定を行う
    if params.require(:record)[:raceflg] == "true"
      if params.require(:record)[:run_distance] == "42.195"
        params.require(:record)[:competition] = "1"
      elsif params.require(:record)[:run_distance] == "21.097"
        params.require(:record)[:competition] = "2"
      else
        params.require(:record)[:competition] = "0"
      end
    end  


    @record = current_user.records.new(record_params)
    if @record.save
      if params.require(:record)[:raceflg] == "true"
         member_update
      end
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
    params.require(:record).permit(:run_day, 
                                   :run_title, 
                                   :run_article, 
                                   :run_distance, 
                                   :run_time, 
                                   :hour, 
                                   :min, 
                                   :sec, 
                                   :raceflg,
                                   :competition)
    
                        
    # params.require(:record).permit(:run_day, :run_title, :run_article, :run_distance, :run_time)
  end  
  
  def update_params
    params.require(:record).permit(:run_day, :run_title, :run_article, :run_distance, :run_time)
  end  
  
  def member_update
    @member = current_user.member
    @record = current_user.records.order(updated_at: :desc).limit(1)
    # エラーになる（undefined method `sumsec' ）
    if params.require(:record)[:competition] == "1" && @record.sumsec > @member.bestfull_sumsec
      @member.bestfullhour = params.require(:record)[:hour]
      @member.bestfullsec = params.require(:record)[:sec]  
      @member.bestfullmin = params.require(:record)[:min]  
    elsif 
      params.require(:record)[:competition] == "2" && @record.sumsec > @member.besthalf_sumsec
      @member.besthalfhour = params.require(:record)[:hour]
      @member.besthalfsec = params.require(:record)[:sec]  
      @member.besthalfmin = params.require(:record)[:min]
    end  
    # params.require(:record)[:hour] = params.require(:record)[:hour] 
    @member.save      
  end
  
end
