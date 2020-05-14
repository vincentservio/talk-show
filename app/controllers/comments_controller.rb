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
             if @comment.valid?
                @comment.save 
                flash[:notice] = "New comment Succsessfully Created "
            redirect_to @tvshow
            else
                    flash[:notice] = "Comment Cannot Be Created Review Entry "

                render :new 
            end 
    end



    def edit
        set_comment
         flash[:notice] = "Comment Edit  "


    end

    def update
        set_comment 
        @comment.update(comment: params[:comment][:comment])
        redirect_to comment_path(@comment)
        flash[:notice] = "Comment Succsessfully Updated"
    end

    def destroy 
        set_comment
        @comment.destroy
        flash[:notice] = "Comment Succsessfully Deleted "
        redirect_to tv_show_path
    end


 

 end 
