class Member < ApplicationRecord
    validates :fullhour, inclusion: { in: 0..7}
    validates :fullmin, inclusion: { in: 0..59}
    validates :fullsec, inclusion: { in: 0..59}
    validates :halfhour, inclusion: { in: 0..2}
    validates :halfmin, inclusion: { in: 0..59}
    validates :halfsec, inclusion: { in: 0..59}
#   belongs_to :user, optional: true
    belongs_to :user
# 下記指定をすると登録ができなくなる  
#   validates :user_id, presence: true 
    def enrollmentymd
        enrollment.strftime("%Y年%m月%d日")
    end
    
    def outsex
        if sex =="M" then
           return  "男性"
        else
           return  "女性"
        end
    end
      # 表示用フルタイム
    def full_time
        "#{fullhour}:#{addzero(fullmin)}:#{addzero(fullsec)}"
    end
    
    # 表示用ハーフタイム
    def half_time
        "#{halfhour}:#{addzero(halfmin)}:#{addzero(halfsec)}"
    end
    
    # フル秒換算
    def full_sumsec
        # halfhour * 3600 + fullmin * 60 + fullsec
        zszs(fullhour,fullmin,fullsec)
    end
    
    # ハーフ秒換算
    def half_sumsec
        zszs(halfhour,halfmin,halfsec)
    end
    
    # フル秒換算
    def self.bestfull_sumsec
        # halfhour * 3600 + fullmin * 60 + fullsec
        zszs(bestfullhour,bestfullmin,bestfullsec)
    end
    
    # ハーフ秒換算
    def self.besthalf_sumsec
        azszs(besthalfhour,besthalfmin,besthalfsec)
    end
    
    # 秒数を求める
    def azszs(hh,mm,ss)
        return hh * 3600 + mm * 60 + ss 
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
end
