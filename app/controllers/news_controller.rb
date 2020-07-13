class NewsController < ApplicationController
  protect_from_forgery :except => :index  
  
   # you can disable csrf protection on controller-by-controller basis:  
  skip_before_action :verify_authenticity_token 

  # before_action :check_auth, only: [:new]
  
  # before_action :auth2, only: [:new]
  before_action :set_news, only: [:show, :edit, :update, :destroy]


  require "net/http"
  require "digest"
  require "openssl"
  require "base64"
  require "json"

  # GET /news
  # GET /news.json
  def index
    @news = News.all
  end

  # GET /news/1
  # GET /news/1.json
  def show
  
  end


  def add_kkwz
    begin
      @news = News.new
      @news.title = "我要测试一下kk新增数据到这里3.0"
      @news.save
      r_id = @news.id
      render json: {"msg": "successs","r_id": r_id}
    rescue
      render json: {"msg": "error"}
    end
  end


  # GET /news/new
  def new
    @news = News.new
  end

  # def auth2
  #   # return template: "error/404" if params["key"].blank?
  #   openid = "396133243191"
  #   openkey =  "uwfininf9yby0lga5qdd"
  #   api_secret = "regrlgq43ria"
  #   aeskey = "6v8ilx8hecibvx5dzu3jgwbf90p1hhaeksasqh8jl0h"
  #   api_name = "bs_get_userid"
  #   api_params = {"user_id" => params["key"]}
  #   result = call_kk_interface(openid,openkey,api_secret,aeskey,api_name,api_params)
  #   session[:user_id] = params["key"]  if result["result"] == "1"
  #   return redirect_to action: :new
  # end  



  # GET /news/1/edit
  def edit
  end

  # POST /news
  # POST /news.json
  def create
    news_params.store('key','sdasadadasd')
    @news = News.new(news_params)
    p "参数："+news_params.inspect
    respond_to do |format|
      if @news.save
        format.html { redirect_to @news, notice: 'News was successfully created.' }
        format.json { render :show, status: :created, location: @news }
      else
        format.html { render :new }
        format.json { render json: @news.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /news/1
  # PATCH/PUT /news/1.json
  def update
    respond_to do |format|
      if @news.update(news_params)
        format.html { redirect_to @news, notice: 'News was successfully updated.' }
        format.json { render :show, status: :ok, location: @news }
      else
        format.html { render :edit }
        format.json { render json: @news.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /news/1
  # DELETE /news/1.json
  def destroy
    @news.destroy
    respond_to do |format|
      format.html { redirect_to news_index_url, notice: 'News was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


############################################################################################

  
  #定时脚本调用
  def self.updateNews
    # 服务器
    # # p Time.new.to_s
    # server = "https://192.168.0.126:8090"
    # # 企业授权
    # openid = "968313330485"
    # openkey = "ung43dwerfyvo5d3e3cc"
    # api_secret = "nfyphhb5pomz"
    # aeskey = "j9iktmdzochigt1mivlznaakoui96vjlpbwhaep19mr"
    # # 计算企业授权请求的签名参数
    # sign = Digest::MD5.hexdigest("enterprise_open_id=#{openid}&enterprise_open_key=#{openkey}&api_secret=#{api_secret}").upcase
    # # 构造企业授权请求参数
    # params = { enterprise_open_id: openid, enterprise_open_key: openkey, sign: sign }
    # # 请求企业授权接口
    # url = "#{server}/open/authorization"
    # resp = https_post(url, params)

    # p resp['resp']
    # # 返回错误直接打印并返回
    # if resp["resp"] == "error"
    #   p resp["msg"]
    #   exit
    # end

    # # 返回的 token 和 有效时间要保存起来, 下次请求时候可以先判断是否过期，如果不过期就不用授权了
    # access_token = resp["access_token"]
    # valid_seconds = resp["valid_seconds"]

    # # api请求参数并转为json字符串t
    # title = News.last.title
    # no = News.last.no
    # p title
    # p no
    # data = { api_name: "bs_add_kepu", api_params: {title: title,no: no} }
    # data_json = URI.escape(data.to_json)

    # # 计算加密data的长度len
    # len = data_json.bytesize
    # # 将len编码为4字节16进制
    # packed_len = [len].pack("L")
    # # 拼接加密串
    # joined_str = "#{packed_len}#{data_json}"

    # # 用AES加密字符串
    # cipher = OpenSSL::Cipher::AES256.new("CBC")
    # cipher.encrypt
    # cipher.key = aeskey[0, 32]
    # cipher.iv = aeskey[0, 16]
    # crypt_str = cipher.update(joined_str)
    # crypt_str << cipher.final
    # # 用Base64编码
    # base64encoded_str = Base64.strict_encode64(crypt_str)

    # # 计算api请求的签名参数
    # sign = Digest::MD5.hexdigest("access_token=#{access_token}&data=#{base64encoded_str}&api_secret=#{api_secret}").upcase
    # # 构造api请求参数
    # params = { access_token: access_token, data: base64encoded_str, sign: sign }

    # # 请求api
    # url = "#{server}/open/api"
    # resp = https_post(url, params)
    # # 返回错误直接打印并返回
    # if resp["resp"] == "error"
    #   p resp["msg"]
    #   exit
    # end

    # # 解密返回 data
    # data = resp["data"]
    # aes_encrypted_data = Base64.strict_decode64(data)
    # cipher = OpenSSL::Cipher::AES256.new("CBC")
    # cipher.decrypt
    # cipher.key = aeskey[0, 32]
    # cipher.iv = aeskey[0, 16]
    # cipher.padding = 0
    # decrypt_str = cipher.update(aes_encrypted_data)
    # decrypt_str << cipher.final

    # # 获取前4个字节并转10进制编码取得 len
    # packed_len = decrypt_str[0,4]
    # len = packed_len.unpack("L").first

    # # 截取json字符串并解析
    # @last_hash = JSON.parse(URI.unescape(decrypt_str[4, len]))
    # p @last_hash
    # #如果成功的话
  end
  
############################################################################################
  #验证kk传过来的用户id是否正确
  def self.validate_userid
    key = params["key"]
    return render json: {code: "0",msg: "error"}  if params["key"].blank?
    api_name = "bs_get_userid"
    api_params = {"user_id" => params["key"]}
    result = call_kk_interface(api_name,api_params)


    return render json: {code: result["result"],msg: "success"} 
    # return render json: {code: 1,msg: "error"}
  end


############################################################################################



  private
    # Use callbacks to share common setup or constraints between actions.
    def set_news
      @news = News.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def news_params
      params.require(:news).permit(:no, :title, :content)
    end

    # def check_auth
    #   return render template: "error/404" if session[:user_id].blank?
    # end  
end
