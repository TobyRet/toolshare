class MapsController < ApplicationController
  def show
    @tool = Tool.find params[:tool_id]
  end
end
