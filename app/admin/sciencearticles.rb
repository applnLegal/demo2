ActiveAdmin.register Sciencearticle do
  
  #隐藏菜单
  # menu false
  config.remove_action_item(:destroy)
  config.remove_action_item(:edit)
  config.remove_action_item(:new)

  #允许数据库传到界面的参数
  permit_params :leadauthor, :title, :content, :time, :isopen, :channel, :reprintinterface
  filter :content

  #默认排序
  config.sort_order = 'supplier_order'


  #绑定的数据表的信息展示,将展示的信息做处理，
  index do
    selectable_column
    column '主要作者',:leadauthor
    column '标题',:title
    column '时间',:time
    column '是否发布',:isopen
    column "发布渠道",:channel 
    column "转载接口",:reprintinterface 
    # column '发表时间',:postdate
    # column "创建时间",:created_at
    # column "更新时间",:updated_at 
    column "密钥",:key
    # actions do |organization
      
    # end
  end

  #右边栏
  sidebar :help,:only => :index do
    "如果你对网站后台管理有问题,请联系CreateByRails@yeah.net"
  end

  form do |f|
    f.inputs do
      f.input :leadauthor,:label=>'主要作者'
      f.input :title,:label=>'标题',:hint => "这里填写标题",:required => true
      # f.input :time,:label=>'时间',:as => :date_select 
      f.input :isopen,:label=>'是否发布',:as => :radio, :collection => ["是", "否"]
      f.input :channel,:label=>'照片',:as => :kindeditor
      f.input :reprintinterface, :label=> "转载接口"  
      f.input :content,:label=>'内容',:as => :kindeditor
      # f.input :content, :as => :ckeditor,input_html: { ckeditor: { toolbar: 'mini' } }
    end
    f.actions
  end

  controller do 
    def create
      logger.info("zhu:"+permitted_params[:sciencearticle].inspect)
      @sciencearticle = Sciencearticle.new(permitted_params[:sciencearticle]) 
      @sciencearticle.key = [*'a'..'z',*'0'..'9',*'A'..'Z'].sample(20).join
      if @sciencearticle.save 
        redirect_to admin_sciencearticle_path(:id=>@sciencearticle.id)
      else 
        render :sciencearticle 
      end 
    end 
  end 
  

  controller do 
    def edit
      key = params["key"]
      return render template: "error/404" if params["key"].blank?
      @article = Sciencearticle.find(params["id"].to_i)
      data_key = @article.key
      return render template: "error/404" if data_key != key
    end 
  end 


  controller do 
    def update
      update! do |f|
        f.html {redirect_to admin_sciencearticle_path(:id=>@sciencearticle.id)}
      end
      #最新数据更新到kk
      result = ApplicationController.call_kk_interface("bs_update_data_by_website",{"tag"=>"科普文章","id"=>@sciencearticle.id.to_s,"data"=>@sciencearticle})
    end 
  end 

  # controller do 
  #   def delete_id
  #     logger.info("DEEP:#{params["data_id"]}")
  #     @article = Articleitself.find(params["data_id"].to_i)
  #     logger.info(@article.inspect)
  #     @article.destroy
  #     # respond_to do |format|
  #     #   redirect_to admin_articleitself_index_path
  #     # end
  #     return render json: {"msg": "删除成功"}
  #   end 
  # end 


end
