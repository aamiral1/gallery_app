class GalleriesController < ApplicationController
    before_action :set_gallery, only: [:show, :edit, :update, :destroy]

    def index
        @galleries = Gallery.all
    end

    def show
    end

    def new
        @gallery = Gallery.new
    end

    def create
        @gallery = Gallery.new(gallery_params)
        
        if @gallery.save
            redirect_to @gallery
        else
            render :new, status: :unprocessable_entity
        end
    end

    def edit
    end

    def update
        if @gallery.update(gallery_params)
            redirect_to @gallery
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @gallery.destroy

        redirect_to galleries_path
    end

    

    private

    def gallery_params
        params.require(:gallery).permit(:title, :description)
    end

    def set_gallery
        @gallery = Gallery.find(params[:id])
    rescue ActiveRecord::RecordNotFound
        redirect_to root_path
    end
end