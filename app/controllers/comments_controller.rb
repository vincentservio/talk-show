class CommentsController < ApplicationController
    def new 
           if params[:tv_show_id]
        @comment = Comment.new

    def index 
        
        @tvshow = TvShow.find_by_id(params[:tv_show_id])
        @comments = @tvshow.comments
       else 
        @comments = Comment.all
    end 
end

    def new 
        
           if params[:tv_show_id]
          
                set_tvshow
        else 
            @comment = Comment.new 
        end 
    end




    def create 
             if params[:tv_show_id]
          
                set_tvshow
                
        @comment = @tvshow.comments.build(comment_params)
                  
        else 
            @comment = Comment.new(comment_params)
        end 
        
        @comment.user_id = current_user.id

            if @comment
                @comment.save 
                redirect_to @tvshow
            else
             
        
                render :new , alert: "Error creating Ingredient!"
            end 

        end




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







    def destory 
    end


    private 
    def set_tvshow
        @tvshow = TvShow.find_by(id: params[:tv_show_id])
    end
     def comment_params
        params.require(:comment).permit(:comment, :user_id)
    end

    end 
