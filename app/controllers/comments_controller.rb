class CommentsController < ApplicationController

 

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
             proper_user
             
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
        if proper_user
        else flash[:notice] = "Must be #{@comment.user.username} to edit"
             redirect_to @comment 
        end
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
        redirect_to tv_show_path
        flash[:notice] = "Comment Succsessfully Deleted "
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
     def proper_user
   @comment.user == current_user
   end
end 
