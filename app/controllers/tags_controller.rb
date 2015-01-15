class TagsController < ApplicationController


  def new
    @tags = Tag.all
    @tag = Tag.new()

  end

  def index
    @tags = Tag.all

  end
    def destroy
    @tag = Tag.find(params[:id])
    @tag.destroy
    redirect_to tags_path

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
