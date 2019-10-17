class Api::V1::PostsController < ApplicationController

  def index
    posts = Post.all
    render json: posts
  end

  def show
    post = Post.find(params[:id])
    render json: post
  end

  def create
    post = Post.new(post_params)
    if post.save
      render json: {status: 200, message: "投稿完了"}
    else
      render json: {status: 400, message: post.errors.full_messages}
    end
  end

  def destroy
    Post.find(params[:id]).destroy
    render json: {status: 200, message: "投稿を削除しました"}
  end

  private 
  
    def post_params
      raw_params = {
        error_message: params[:error_message],
        description: params[:description],
        user_id: params[:user_id]
      }
      params = ActionController::Parameters.new(raw_params)
      params.permit(:error_message, :description, :language, :user_id)
    end
end
