ActiveAdmin.register Fivesystem do
  #隐藏菜单
  menu false

  permit_params :title, :content
  filter :title, :label=>'标题'
  filter :content, :label=>'内容'

  # menu label: "五大体系",priority: 2

  index do
    # selectable_column
    column '标题',:title
    # column '内容',:content
    # column "创建时间",:created_at
    # column "更新时间",:updated_at 
    # actions do |organization|
      
    # end
  end
  

  form do |f|
    f.inputs do
      f.input :title,:label=>'标题'
      f.input :content,:label=>'内容'
    end
    f.actions
  end

end
