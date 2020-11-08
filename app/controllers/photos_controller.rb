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
  
  def delete
  the_id = params.fetch("path_id")
  the_photo = Photo.where({:id => the_id}).first
  the_photo.destroy
  redirect_to("/photos")
  # render ({:template => "photos_templates/delete.html.erb"})
  end

  def create
    input_image = params.fetch("query_image")
    input_caption = params.fetch("query_caption")
    input_owner_id = params.fetch("query_owner_id")
    
    a_new_photo = Photo.new
    
    a_new_photo.image = input_image
    a_new_photo.caption = input_caption
    a_new_photo.owner_id = input_owner_id

    a_new_photo.save

    redirect_to("/photos/" + a_new_photo.id.to_s)
    # render({:template => "photos_templates/create.html.erb"})
  end

end
