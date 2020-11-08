class PhotosController < ApplicationController

  def index
    matching_photos = Photo.all
    @list_of_photos = matching_photos.order({ :created_at => :desc })
    render ({:template => "photos_templates/index.html.erb"})
  end
  
  def show
    #  Parameters: {"path_username"=>"sample"}
    url_photo = params.fetch("path_username")
    matching_usernames = User.where({ :username => url_username})
    @the_user = matching_usernames.first

    render ({:template => "photos_templates/show.html.erb"})
  end

end
