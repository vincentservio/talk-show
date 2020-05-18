class TvShowsController < ApplicationController

    def index 
        @tvshows =  TvShow.all
    end 

    def show
        set_tvshow
        @user = current_user 
            if @tvshow 
                render  "show"
            else 
                redirect_to tv_shows_path
            end 
    end

    def new 
        @tvshow = TvShow.new
        @comment = Comment.new
    end 

    def create
        @tvshow = TvShow.new
        @tvshow.title = params[:title].titleize
        @tvshow.network = params[:network]
        @tvshow.rate = params[:rate]
        if @tvshow.valid?
            @tvshow.save
            flash[:notice] = "New Show Succsessfully Created "
            redirect_to tv_shows_path(@tv_show)
        else 
            render :new  
        end
    end

    def edit
        set_tvshow
    end


    def update
        set_tvshow
        if @tvshow
           @tvshow.update(tvshow_params)
            flash[:notice] = "Show Succsessfully Updated"
            redirect_to tv_show_path
        else
            flash[:notice] = "Show Cannot Be Updated Please Review"
        redirect_to tv_show_path
            end
     
    end

    def destroy
        set_tvshow
        @tvshow.destroy
                 flash[:notice] = "Show Succsessfully deleted "

        redirect_to tv_shows_path
    end

   

    def recent
        @tvshows = TvShow.recent
    end 
 
    def most_comments
        @tvshows = TvShow.most_comments
    end


    private 
    def set_tvshow
        @tvshow = TvShow.find_by(id: params[:id])
    end

    def tvshow_params 
        params.require(:tv_show).permit(:title, :network, :rate)
    end 
end
