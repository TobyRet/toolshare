class ToolsController < ApplicationController

  before_action :authenticate_user!, only: [:new, :create, :destroy]

  def index
    @tools = Tool.all
  end

  def new
    @tool = Tool.new
  end

  def create
    @tool = Tool.new params[:tool].permit(:title, :body, :street, :city, :picture)
    @tool.user = current_user
    
    if @tool.save
      redirect_to '/tools'
    else
      render 'new'
    end
  end

  def show
    @tool = Tool.find params[:id]
    respond_to do |format|
      format.html
      format.json { render json: @tool }
    end
  end
  
end
