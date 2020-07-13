Rails.application.routes.draw do
  get 'sciencearticle/new'

  get 'sciencearticle/create'

  get 'sciencearticle/edit'

  get 'sciencearticle/update'

  get 'sciencearticle/delete'

  mount Ckeditor::Engine => '/ckeditor'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "welcome/say_hello" => "welcome#say"
  get "index" => "welcome#index"
  get "news" => "news#index"
  get "index_p" => "welcome#index_p"
  # get "fsc" => "welcome#index"

  #进来先判断是移动端还是电脑端
  root :to => "welcome#path"   


  #页面跳转
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get "news_detail" =>"welcome#news_detail"
  get "science_detail" =>"welcome#science_detail"
  get "news_detail_p" =>"welcome#news_detail_p"
  get "science_detail_p" =>"welcome#science_detail_p"

  get "news_lists" =>"lists#news_lists"
  get "news_lists_p" =>"lists#news_lists_p"

  get "science_lists" =>"lists#science_lists"
  get "science_lists_p" =>"lists#science_lists_p"
  # get "science_lists" =>"lists#science_lists"

  post 'add_kkwz' => 'product#add_kkwz'
  post "delete_kkwz" => 'product#delete_kkwz'
  
  # post "delete_id" => "admin/articleitself#delete_id"


  get 'qrcode' =>"welcome#make_qr_code"

  # /admin 
  devise_for :admin_users, ActiveAdmin::Devise.config
  ActiveAdmin.routes(self)


  # resources :news
  # resources :users
  # resources :fivesystem
  # resources :articleitself
end
