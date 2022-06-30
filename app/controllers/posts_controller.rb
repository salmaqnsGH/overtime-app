class PostsController < ApplicationController
    before_action :set_post, only: [:show, :edit, :update, :destroy]
    
    def index
        @posts = Post.all
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)
        @post.user_id = current_user.id

        if @post.save
            redirect_to posts_path, success: 'Your post was created successfully'
        else
            render :new
        end
    end

    def edit
    end

    def update
        @post.update(post_params)
        redirect_to posts_path, success: 'Your post was updated successfully'
    end

    def destroy
        @post.destroy
        respond_to do |format|
            format.html { redirect_to posts_path, danger: 'Your post was deleted' }
            format.json { head :no_content }
        end
    end

    def show
        
    end

    private
        def post_params
            params.require(:post).permit(:date, :rationale)
        end
        def set_post
            @post = Post.find(params[:id])
        end
end
