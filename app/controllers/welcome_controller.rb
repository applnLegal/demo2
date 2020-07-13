class WelcomeController < ApplicationController


  def index
    @news = News.all.limit(8).order(created_at: :desc)  #去最新的8条新闻
    @fivesystems = Fivesystem.all
    @sciences = Science.all
    # @default_fs_content = Fivesystem.find_by(:id => 3)
    # if params[:id].blank?
    #   params[:id] = 3
    # else
    #   params[:id] = params[:id]
    # end
    # @fs_contents = Fivesystem.find_by(:id => params[:id]).content
    
  end
  
  def news_detail
    @news = News.find_by(:no => params[:no])
    pre = params[:no].to_i - 1 
    after = params[:no].to_i + 1
    @news_pre = News.find_by(:no => pre.to_s)
    @news_next = News.find_by(:no => after.to_s)
  end

  def science_detail
    @science = Science.find_by(:no => params[:no])
    pre = params[:no].to_i - 1 
    after = params[:no].to_i + 1
    @science_pre = Science.find_by(:no => pre.to_s)
    @science_next = Science.find_by(:no => after.to_s)
  end

  def path
    user_agent=request.user_agent
    user_agent_parsed = UserAgent.parse(user_agent)
    platform = user_agent_parsed.platform    #Windows Android
    browser = user_agent_parsed.browser   #Chrome Firefox 
    if platform == "Windows"
      redirect_to(:action => 'index')
    else 
      redirect_to(:action => 'index_p')
    end
  end

  # 移动端
  def index_p
    @news = News.all.limit(8).order(created_at: :desc)  #去最新的8条新闻
    @sciences = Science.all
    @fivesystems = Fivesystem.all
  end

  def news_detail_p
    @news = News.find_by(:no => params[:no])
    pre = params[:no].to_i - 1 
    after = params[:no].to_i + 1
    @news_pre = News.find_by(:no => pre.to_s)
    @news_next = News.find_by(:no => after.to_s)
  end

  def science_detail_p
    @science = Science.find_by(:no => params[:no])
    pre = params[:no].to_i - 1 
    after = params[:no].to_i + 1
    @science_pre = Science.find_by(:no => pre.to_s)
    @science_next = Science.find_by(:no => after.to_s)
  end

  # def fsc
  #   if params[:id].blank?
  #     params[:id] = 3
  #   else
  #     params[:id] = params[:id]
  #   end
  #   @fs_contents = Fivesystem.find_by(:id => params[:id]).content
  #   @id = params[:id]
  #   respond_to do |format|
  #     format.html { redirect_to index_path, notice: '地址新增成功。' }
  #     format.js
  #   end
  # end

  def make_qr_code
    qr = RQRCode::QRCode.new( params[:code], :size => 4, :level => :h )
    @qrcode_str = Base64.encode64( qr.to_img.resize(400,400).to_s )
    console(@qrcode_str)
    #如果要保存的话，如下
    qr.to_img.resize(400, 400).save("#{Rails.root}/public/tmp/my_qrcode.png")
  end

  def make_barcode(content)
    data = Barby::Code39.new(content)
    base64_output = Base64.encode64 data.to_png({ margin: 2, xdim: 3, ydim: 3 })
    "data:image/png;base64,#{base64_output}".gsub(/\n/, '')
  end

end
