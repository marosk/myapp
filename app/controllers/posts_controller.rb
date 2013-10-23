class PostsController < ApplicationController
  before_action :set_post, only: [:show, :destroy]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
  
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
 # def edit
  #end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
	# Reverse string
	if(@post.message.size == 0)
	  render "posts/new"
	else
	  @post.message.reverse!
		
	  respond_to do |format|
	  if @post.save
		format.html { redirect_to @post, notice: 'Message was successfully reversed.' }
		format.json { render action: 'show', status: :created, location: @post }
	  else
		format.html { render action: 'new' }
		format.json { render json: @post.errors, status: :unprocessable_entity }
	  end
	 end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:message)
    end
end
