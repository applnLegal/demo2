class ListsController < ApplicationController

  def news_lists
    if params[:page].blank?
      params[:page] = 1
    end
    @news = News.all.page(params[:page]).per(4)
  end 

  def news_lists_p
    if params[:page].blank?
      params[:page] = 1
    end
    @news = News.all.page(params[:page]).per(5)
  end 

  def science_lists
    if params[:page].blank?
      params[:page] = 1
    end
    @sciences = Science.all.page(params[:page]).per(4)
  end 

  def science_lists_p
    if params[:page].blank?
      params[:page] = 1
    end
    @sciences = Science.all.page(params[:page]).per(5)
  end 

end
