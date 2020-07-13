class ApplicationController < ActionController::Base
  # protect_from_forgery with: :exception
  # skip_before_action :verify_authenticity_token
  
  # before_action :verify_id
  # def verify_id
  #   logger.info("域名"+request.env['PATH_INFO'].to_s)
  #   if request.present?
  #     logger.info(request.env['PATH_INFO'].to_s)
  #     if request.env['PATH_INFO'].to_s.include?('/admin/')
  #       return render template: "error/404.html"  if params[:key].blank?
  #       return render template: "error/404.html" if DateTime.current.strftime('%Q').to_i - params[:key].to_i > 3000
  #     end 
  #   else
  #     logger.info("请重新发起申请")
  #   end
  # end 

############################################################################################
  #http_post方法
  def self.https_post url, params
    _url = URI.parse(url) 
    http = Net::HTTP.new(_url.host, _url.port)
    http.verify_mode = OpenSSL::SSL::VERIFY_NONE
    http.use_ssl = true
    request = Net::HTTP::Post.new(_url.request_uri)
    request['Content-Type'] = 'application/json;charset=utf-8'
    request.body = params.to_json
    response = http.start{ |ht| ht.request(request) }
    JSON.parse(response.body)
  end

  #调取kk接口
  def self.call_kk_interface api_name,api_params
    server = "https://192.168.0.126:8090"
    # 企业授权
    openid = "968313330485"
    openkey = "ung43dwerfyvo5d3e3cc"
    api_secret = "nfyphhb5pomz"
    aeskey = "j9iktmdzochigt1mivlznaakoui96vjlpbwhaep19mr"
    # 计算企业授权请求的签名参数
    sign = Digest::MD5.hexdigest("enterprise_open_id=#{openid}&enterprise_open_key=#{openkey}&api_secret=#{api_secret}").upcase
    # 构造企业授权请求参数
    params = { enterprise_open_id: openid, enterprise_open_key: openkey, sign: sign }
    # 请求企业授权接口
    url = "#{server}/open/authorization"
    resp = ApplicationController.https_post(url, params)

    p resp['resp']
    # 返回错误直接打印并返回
    if resp["resp"] == "error"
      p resp["msg"]
      exit
    end

    # 返回的 token 和 有效时间要保存起来, 下次请求时候可以先判断是否过期，如果不过期就不用授权了
    access_token = resp["access_token"]
    valid_seconds = resp["valid_seconds"]

    # api请求参数并转为json字符串
    data = { api_name: api_name, api_params: api_params }
    data_json = URI.escape(data.to_json)

    # 计算加密data的长度len
    len = data_json.bytesize
    # 将len编码为4字节16进制
    packed_len = [len].pack("L")
    # 拼接加密串
    joined_str = "#{packed_len}#{data_json}"

    # 用AES加密字符串
    cipher = OpenSSL::Cipher::AES256.new("CBC")
    cipher.encrypt
    cipher.key = aeskey[0, 32]
    cipher.iv = aeskey[0, 16]
    crypt_str = cipher.update(joined_str)
    crypt_str << cipher.final
    # 用Base64编码
    base64encoded_str = Base64.strict_encode64(crypt_str)

    # 计算api请求的签名参数
    sign = Digest::MD5.hexdigest("access_token=#{access_token}&data=#{base64encoded_str}&api_secret=#{api_secret}").upcase
    # 构造api请求参数
    params = { access_token: access_token, data: base64encoded_str, sign: sign }

    # 请求api
    url = "#{server}/open/api"
    resp = ApplicationController.https_post(url, params)
    # 返回错误直接打印并返回
    if resp["resp"] == "error"
      p resp["msg"]
      exit
    end

    # 解密返回 data
    data = resp["data"]
    aes_encrypted_data = Base64.strict_decode64(data)
    cipher = OpenSSL::Cipher::AES256.new("CBC")
    cipher.decrypt
    cipher.key = aeskey[0, 32]
    cipher.iv = aeskey[0, 16]
    cipher.padding = 0
    decrypt_str = cipher.update(aes_encrypted_data)
    decrypt_str << cipher.final

    # 获取前4个字节并转10进制编码取得 len
    packed_len = decrypt_str[0,4]
    len = packed_len.unpack("L").first

    # 截取json字符串并解析
    @last_hash = JSON.parse(URI.unescape(decrypt_str[4, len]))
    p @last_hash
    return @last_hash
  end

end
