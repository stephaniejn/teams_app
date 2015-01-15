class TagsController < ApplicationController


  def new
    @tags = Tag.all
    @tag = Tag.new()
  end

  def index
    @tags = Tag.all
    @tag = Tag.find_by(params[:id])


  end
    def destroy
    @tag = Tag.find(params[:id])
    if(@tag.teams.length == 0)
    @tag.destroy
    redirect_to tags_path
  else
    flash[:danger] = "Cannot delete this tag because there are " + @tag.teams.length.to_s + " teams using it"
    redirect_to tags_path
  end

  end



def create
  @tag = Tag.create(tag_params)
  @tags = Tag.all
  if @tag.errors.any?
    render :new
  else
    flash[:success] = "Added"
    redirect_to tags_path
  end
end

private
def tag_params
  params.require(:tag).permit(:name)
end

end
