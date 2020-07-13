ActiveAdmin.register Science do

  #隐藏菜单
  menu false
  
  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :title, :no, :content, :source, :author, :postdate
  #
  # or
  #
  # permit_params do
  #   permitted = [:title, :no, :content, :source, :author, :postdate]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end
  permit_params :no, :title, :content, :source , :author , :postdate , :pic, :introduce
  filter :content

  # menu label: "科学传播",priority: 1

  index do
    # selectable_column
    column '编号',:no
    column '标题',:title
    # column '来源',:source
    # column '作者',:author
    # column '发表时间',:postdate
    # column "创建时间",:created_at
    # column "更新时间",:updated_at 
    # column "照片",:pic
    # column "简介",:introduce
    # actions do |organization|
      
    # end
  end


  form :html => { :enctype => "multipart/form-data"} do |f|
    f.inputs do
      f.input :no,:label=>'编号'
      f.input :title,:label=>'标题'
      f.input :source,:label=>'来源'
      f.input :author,:label=>'作者'
      f.input :postdate,:label=>'发表时间'
      f.input :pic,:label=>'照片',:as => :kindeditor
      f.input :introduce,:label=>'简介'
      f.input :content,:label=>'内容',:as => :kindeditor
      # f.input :content, :as => :ckeditor,input_html: { ckeditor: { toolbar: 'mini' } }
    end
    f.actions
  end
  



end
