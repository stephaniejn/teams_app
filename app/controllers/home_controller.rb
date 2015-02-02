class HomeController < ApplicationController
  def index
    @teams = Team.all
    @team = Team.new()
  end

end
