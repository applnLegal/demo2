class ArticleitselfController < ApplicationController


  #定时脚本调用 , 科考文章
  def self.addarticleitself    
    api_name = "bs_add_data_by_website"
    articleitself = Articleitself.all
    break if articleitself.blank?
    api_params = {"tag" => "科考文章","data" => articleitself}
    result = call_kk_interface(api_name,api_params)
    p "时间："+Time.new.to_s+","+result.inspect
  end


##############################################################################################
 
end
