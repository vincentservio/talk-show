class CommentsController < ApplicationController

    def index 
       if params[:tv_show_id]  && params[:user_id]
        set_tvshow
        @comments = @tvshow.comments
        else 
            @comments = Comment.all
        end 
    end

    def show 
        set_comment
end
    def new 
        if params[:tv_show_id]
           set_tvshow
        @comment = @tvshow.comments.build
        else 
            @comment = Comment.new 
        end 
    end

    def create 
        if params[:tv_show_id]
           set_tvshow
        @comment = @tvshow.comments.build(comment_params)
        else 
            set_comment
        end 
            @comment.user_id = current_user.id
        if @comment
       
            @comment.save 
            redirect_to @tvshow
        else
            render :new 
        end 
    end



    def edit
        set_comment
    end

    def update
  @comment = Comment.find(params[:id])
  @comment.update(comment: params[:comment][:comment])
  redirect_to comment_path(@comment)
end

    def destroy 
        
        set_comment
        @comment.destroy
        redirect_to tv_show_path
    end


    private 
    def set_tvshow
        @tvshow = TvShow.find_by(id: params[:tv_show_id])
    end

    def set_comment
        @comment = Comment.find_by(id: params[:id])
    end

     def comment_params
        params.require(:comment).permit(:comment, :user_id)
    end

    end 
