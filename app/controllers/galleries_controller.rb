class GalleriesController < ApplicationController
    before_action :set_gallery, only: [:show, :edit, :update, :destroy]
    before_action :authenticate_user!, except: [:index, :show] 
    before_action :authorize_gallery_owner, only: [:edit, :update]
    authorize_resource

    def index
        @galleries = Gallery.all
    end

    def show
        if current_user.present?
            @can_edit_gallery = (@gallery.owner.to_s == current_user.id.to_s)
            puts "Gallery owner: " + @gallery.owner.to_s
            puts "Current User: " + current_user.id.to_s
        end
    end

    def new
        @gallery = Gallery.new
    end

    def create
        @gallery = Gallery.new(gallery_params)
        @gallery.owner = current_user.id.to_s

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

    def authorize_gallery_owner
        @gallery = Gallery.find(params[:id])
        puts "Gallery owner: " + @gallery.owner.to_s
        puts "Current User: " + current_user.id.to_s
        unless @gallery.owner.to_s == current_user.id.to_s
          redirect_to root_path
        end
    end
end