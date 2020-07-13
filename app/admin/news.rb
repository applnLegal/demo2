ActiveAdmin.register News do
  
  # protect_from_forgery :except => :index
  # skip_before_action :verify_authenticity_token
  # before_action :new
  # before_action :auth2, only: [:new]
  #隐藏菜单
  menu false

  #允许数据库传到界面的参数
  permit_params :no, :title, :content, :source, :author, :pic, :introduce, :postdate ,:key
  filter :content

  #分页查询
  config.paginate = true
  # config.per_page = 5

  #默认排序
  config.sort_order = 'supplier_order'

  #列表名字
  # menu label: "新闻",priority: 1


  #绑定的数据表的信息展示,将展示的信息做处理，
  index do
    selectable_column
    column '编号',:no
    column '标题',:title
    column '来源',:source
    column '作者',:author
    column "照片",:pic 
    column "简介",:introduce 
    # column '发表时间',:postdate
    # column "创建时间",:created_at
    # column "更新时间",:updated_at 
    column "密钥",:key
    actions do |organization|
      
    end
  end
  actions :all, except: [:edit]

  #右边栏
  sidebar :help,:only => :index do
    "如果你对网站后台管理有问题,请联系CreateByRails@yeah.net"
  end

  form do |f|
    f.inputs do
      f.input :no,:label=>'编号'
      f.input :title,:label=>'标题',:hint => "这里填写标题",:required => true
      f.input :source,:label=>'来源',:required => true
      f.input :author,:label=>'作者'
      f.input :pic,:label=>'照片',:input_html => { :rows => "5"}, :as => :kindeditor
      
      f.input :introduce, :input_html => { :rows => "5"}, :label=> "备注"
      f.input :postdate,:label=>'发表时间'
      f.input :content,:label=>'内容',:as => :kindeditor
      f.input :key
      # f.input :content, :as => :ckeditor,input_html: { ckeditor: { toolbar: 'mini' } }
    end
    f.actions
  end


  # controller do 
  #   def create 
  #     # news_params.store('key','sdasadadasd')
  #     @news = News.new(news_params)
  #     @news.key = "sdad"
  #     if @news.save
  #       format.html { redirect_to @news, notice: 'News was successfully created.' }
  #       format.json { render :show, status: :created, location: @news }
  #     else
  #       format.html { render :new }
  #       format.json { render json: @news.errors, status: :unprocessable_entity }
  #     end
  #   end 
  # end 

  controller do 
    def create
      @new = News.new(permitted_params[:news]) 
      @new.key = [*'a'..'z',*'0'..'9',*'A'..'Z'].sample(20).join
      # @new.save!
      if @new.save 
        redirect_to admin_news_path(:id=>@new.id)
      else 
        render :new 
      end 
    end 
  end 
  
  # collection_action :auth, :method => :post do
  #   return render json: {code: "0",msg: "error"} if params["key"].blank?
  #   openid = "396133243191"
  #   openkey =  "uwfininf9yby0lga5qdd"
  #   api_secret = "regrlgq43ria"
  #   aeskey = "6v8ilx8hecibvx5dzu3jgwbf90p1hhaeksasqh8jl0h"
  #   api_name = "bs_get_userid"
  #   api_params = {"user_id" => params["key"]}
  #   result = call_kk_interface(openid,openkey,api_secret,aeskey,api_name,api_params)
  #   if result["result"] == "1"
  #     @news = News.new
  #   end

  #   # return render file: "/news/index"
  #   # return render json: {code: result["result"],msg: "success"} 
  # end


  
  # collection_action :auth2, :method => :post do
  #   # return template: "error/404" if params["key"].blank?
  #   openid = "396133243191"
  #   openkey =  "uwfininf9yby0lga5qdd"
  #   api_secret = "regrlgq43ria"
  #   aeskey = "6v8ilx8hecibvx5dzu3jgwbf90p1hhaeksasqh8jl0h"
  #   api_name = "bs_get_userid"
  #   api_params = {"user_id" => params["key"]}
  #   result = call_kk_interface(openid,openkey,api_secret,aeskey,api_name,api_params)
  #   session[:user_id] = params["key"]  if result["result"] == "1"
  #   # return redirect_to action: :new
  #   return render json: {code: session[:user_id],msg: "success"} 
  # end  

  # collection_action :new, :method => :get do
  #   return render template: "error/404.html" if session[:user_id].blank?
  #   # @new = News.new
  # end
end
