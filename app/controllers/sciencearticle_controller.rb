class SciencearticleController < ApplicationController


##################################################################################
  #定时脚本调用 , 科普文章
  def self.addsciencearticle    
    api_name = "bs_add_data_by_website"
    article = Sciencearticle.all
    # break if article.blank?
    api_params = {"tag" => "科普文章","data" => article}
    result = call_kk_interface(api_name,api_params)
    p "时间："+Time.new.to_s+","+result.inspect
  end

end
