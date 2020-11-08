class PhotosController < ApplicationController

  def index
    matching_photos = Photo.all
    @list_of_photos = matching_photos.order({ :created_at => :desc })
    render ({:template => "photos_templates/index.html.erb"})
  end
  
  def show
    #  Parameters: {"path_username"=>"sample"}
    url_photo = params.fetch("path_id")
    matching_ids = Photo.where({ :id => url_photo})
    @the_photo = matching_ids.first

    render ({:template => "photos_templates/show.html.erb"})
  end

end
