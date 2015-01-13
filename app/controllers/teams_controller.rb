class TeamsController < ApplicationController

  def index
    @teams = Team.all
    @team = Team.new()
  end

  def new
    @team = Team.new()
  end

  def edit
    @team = Team.find(params[:id])

  end

  def update
    @team = Team.find(params[:id])
    @team.update(team_params)
    if @team.errors.any?
        render :new
      else
        flash[:success] = "Added"
        redirect_to @team
  end

  end

  def show
    @team = Team.find(params[:id])
  end

  def create
    @team = Team.create(team_params)
    if @team.errors.any?
        render :new
      else
        flash[:success] = "Added"
        redirect_to "/teams"
  end
end

  def destroy
    @team = Team.find(params[:id])
    @team.destroy
    redirect_to teams_path
  end

  private
  def team_params
    params.require(:team).permit(:title, :desc, :loc)
  end

end