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
       
    end 

    def create
        tvshow = TvShow.new
        
        tvshow.title = params[:title]
        tvshow.network = params[:network]
        tvshow.rate = params[:rate]
        tvshow.time = params[:time]
        
        if tvshow.valid?
            tvshow.save
            redirect_to tv_shows_path(@tv_show)
        else 
            render :new
         end
    end
end
