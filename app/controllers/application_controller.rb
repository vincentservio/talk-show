class ApplicationController < ActionController::Base
 helper_method :current_user
   before_action :authenticate_user!


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
