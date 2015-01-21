class TeamsController < ApplicationController

  def index
    @teams = Team.all
    @team = Team.new()
  end

  def new
    @team = Team.new()
    @tags = Tag.all
  end

  def edit
    @team = Team.find(params[:id])
    @tags = Tag.all

  end

  def update

    @team = Team.find(params[:id])
    @team.update(team_params)

    if @team.errors.any?
      render :new
    else
      @team.tags.clear
      tags = params[:team][:tag_ids]
      tags.each do |tag_id|
        @team.tags << Tag.find(tag_id) unless tag_id.blank?
      end
      flash[:success] = "Added"
      redirect_to @team
    end

  end

  def show
    @team = Team.find(params[:id])

  end

  def tag
    tag = Tag.find_by_name(params[:tag])
    if tag
      @teams = tag.teams
    else
      @teams = []

    end
  end

  def create
    @team = Team.create(team_params)
    @tags = Tag.all
    if @team.errors.any?
      render :new
    else
      @team.tags.clear
      tags = params[:team][:tag_ids]
      tags.each do |tag_id|
        @team.tags << Tag.find(tag_id) unless tag_id.blank?
      end
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