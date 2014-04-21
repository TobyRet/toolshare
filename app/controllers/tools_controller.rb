class ToolsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create, :destroy]

  def index
    @tools = Tool.all
  end

  def new
    @tool = Tool.new
  end

  def create
    @tool = Tool.new params[:tool].permit(:title, :body, :location, :price, :picture)
    @tool.user = current_user
    
    if @tool.save
      redirect_to '/tools'
    else
      render 'new'
    end
  end

  def show
    @tool = Tool.find params[:id]
  end
  
end
