class SongsController < ApplicationController
    
    def index
        @songs = Song.all
    end

    def new
        @song = Song.new
    end

    def create
        @song = Song.new(song_params)
        if @song.valid?
            @song.save
            redirect_to song_path(@song)
        else
            render :new
        end
    end

    def show
        @song = Song.find(params[:id])
    end

    def edit
        @song = Song.find(params[:id])
    end

    def update
        @song = Song.update(song_params)
        if @song.valid?
            @song.save
            redirect_to song_params(@song)
        else
            render :edit
        end
    end

    def destroy
        @song = Song.find(params[:id]).destroy
        redirect_to song_path(@song)
    end

    private

        def song_params(*args)
            params.require(:song).permit(:title, :released, :release_year, :artist_name, :genre)
        end
end
