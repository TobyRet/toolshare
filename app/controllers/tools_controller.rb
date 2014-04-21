class ToolsController < ApplicationController

  def index
    @tools = Tool.all
  end

  def new
    @tool = Tool.new
  end

  def create
    @tool = Tool.new params[:tool].permit(:title, :body, :location, :price, :picture)
    
    if @tool.save
      redirect_to '/tools'
    else
      render 'new'
    end
  end
  
end
