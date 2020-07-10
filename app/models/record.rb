class Record < ApplicationRecord
  validates :run_title, presence: true 
  validates :run_day, presence: true 
  validates :run_distance, numericality: true
  validates :run_distance, inclusion: { in: 0..999}
  validates :hour, inclusion: { in: 0..999}
  validates :min, inclusion: { in: 0..59}
  validates :sec, inclusion: { in: 0..59}
  
  belongs_to :user
  
  # 表示用タイム
  def run_time
    "#{addzero(hour)}:#{addzero(min)}:#{addzero(sec)}"
  end
  # 表示用種目
  def out_competition
      edit_competition(competition)
  end
  
  # タイム秒換算
  def sumsec
      return hour * 3600 + min * 60 + sec 
  end
    

   # 表示用タイムに前ゼロを付加
  def addzero(number_b)
    if number_b.to_i < 10 then
      number_a = "0" + number_b.to_s 
    else
      number_a = number_b.to_s
    end
    return number_a
  end  
  
  def edit_competition(competition_b)
    if competition_b == "1" then
      competition_a = "フル" 
    elsif competition_b == "2" then
      competition_a = "ハーフ"
    elsif competition_b == "0" then
      competition_a = "その他"
    else
      competition_a = "ー"
    end
    return competition_a
  end 
  
  # 秒数を求める
  def zszs(hh,mm,ss)
      return hh * 3600 + mm * 60 + ss 
  end
    
  # ここから先は使っているか否か不明？
  # 月別アーカイブのメソッド
  # レコード総件数
  def d 
    return Record.count
  end 
  
  def d1
    # return Record.group(run_day)
    return Record.group("DATE_FORMAT(run_day, '%Y%m')").select("DATE_FORMAT(run_day, '%Y%m') as month, count(id) as cnt")
    # return Record.group("strftime('%Y%m', run_day)").order(Arel.sql("strftime('%Y%m', run_day) desc"))
  end
  

  

  
  def e
    if self.run_distance >= 20
      return "すごい"
    else
      return "まあまあ"
    end  
  end  
end
