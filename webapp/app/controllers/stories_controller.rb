class StoriesController < ApplicationController

  $user_id_login_render = -1;

  def show
    @story = Story.find(params[:id])
  end
  def index
    @storiess = Story.last(10).reverse
  end

  def new

  end

  def create

    @story = Story.new(params.require(:story).permit(:title, :merchant, :product_title, :desc, :image))
    @story_existing = Story.all
    @max_id = @story_existing.maximum("id")

    for i in 1..@max_id
      @story_exists = @story_existing.exists?(:id => i)
      if @story_exists == true
        puts "MY TTITLE IS"
        puts @story.title
        if @story_existing.find(i).title == @story.title
          @story_existing.find(i).destroy
        end
      end
    end

    @story.save
    redirect_to story_path(@story)
  end

  def destroy
    @story = Story.find(params[:id])
    @story.destroy
    redirect_to stories_path
  end

  def login

  end



  def home_login
    user_login_id = params['myform']
    $user_id_login_render = user_login_id
    puts "The id of the merchant is"
    puts user_login_id

    @user_existing = Story.all
    @user_exists = @user_existing.exists?(:title => user_login_id)
    if @user_exists == true
      @story = Story.find_by(title: user_login_id)
    else
      redirect_to stories_path
    end
  end


  def stories_paths

    @stor = Story.find(params[:id])
    puts "WE ARE HERE NOW"
    puts @stor.title

  end



end
