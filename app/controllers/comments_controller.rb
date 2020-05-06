class CommentsController < ApplicationController
    def new 
           if params[:tv_show_id]
        @comment = Comment.new

        @tvshow = TvShow.find_by(id: params[:tv_show_id])
      @comment = @tvshow.comments.build
    else 
        @comment = Comment.new 
    end 
end




    def create 
                @tvshow = TvShow.find_by(id: params[:tv_show_id])

        @comment = Comment.new
        @comment.user_id = current_user.id
        @comment.tv_show_id = @tvshow
        byebug


        # if params[:tv_show_id]

        #     @tvshow = TvShow.find_by_id(params[:tv_show_id])

        #     @comment = @tvshow.comments.build(comment_params)
          
        # else 
        #     @comment = Comment.new(comment_params)
        # end 
        # if @comment.save 
        #     redirect_to @comment
        # else 
        #     render :new, alert: "Error creating Ingredient!"
        # end

    end





    def destory 
    end


    private 

     def comment_params
        params.require(:comment).permit(:comment)
    end

    end 
