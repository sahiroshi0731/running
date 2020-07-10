module ApplicationHelper
  
  # YYYY年MM月（件数）で表示
  def ymconv(yyyymm,cnt)
    yyyy = yyyymm[0,4]
    mm = yyyymm[4,2]
    return yyyy + "年" + mm + "月 (" + cnt + ")"
  end
  
  # 一覧のタイトル表示切替用
  def ymkirikaeconv(ym)
    if current_page?(records_path) || current_page?(root_path)
       str = "今月の記録"
    else
       str = ym + "の記録"  
    end  
    return str
  end  
  
end
