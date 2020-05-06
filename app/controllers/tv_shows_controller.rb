class TvShowsController < ApplicationController
 
 
    def index 
      @tvshows =  TvShow.all
    end 
 
    def show
         @tvshow = TvShow.find_by(id:params[:id])
            
            if @tvshow 
                render  "show"
            else 
                redirect_to tv_shows_path
            end 
    end

    def new 
       @tvshow = TvShow.new
    end 

    def create
        @tvshow = TvShow.new
        
        @tvshow.title = params[:title].titleize
        @tvshow.network = params[:network]
        @tvshow.rate = params[:rate]
         
        if @tvshow.valid?
            @tvshow.save

            redirect_to tv_shows_path(@tv_show)
        else 
            render :new
         end
    end

    private 

    def post_params 
        params.require(:tvshow).permit(:title, :network, :rate, :time)
    end 
end
