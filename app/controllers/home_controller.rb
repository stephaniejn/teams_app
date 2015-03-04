class HomeController < ApplicationController
  def index
    @teams = Team.all
    @team = Team.new()
    @tags = Tag.all
  end

end
