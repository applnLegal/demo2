class ProductController < ApplicationController

  def add_kkwz
    begin
      p_name = params["key"]
      @news = Product.new
      @news.name = p_name
      @news.save
      r_id = @news.id
      render json: {"msg": "success","r_id": r_id}
    rescue
      render json: {"msg": "error"}
    end
  end

  def delete_kkwz
    begin
      r_id = params["r_id"]
      if r_id.present?
        Product.delete(r_id)
        render json: {'msg': "success"}
      end
    rescue
      render json: {"msg": "error"}
    end
  end

end
