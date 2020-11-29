class UsersController < ApplicationController

  def index
    matching_users = User.all
    @list_of_users = matching_users.order({ :username => :asc })
    render ({:template => "user_templates/index.html.erb"})
  end
  def show
    #  Parameters: {"path_username"=>"sample"}
    url_username = params.fetch("path_username")
    matching_usernames = User.where({ :username => url_username})
    @the_user = matching_usernames.first

    render ({:template => "user_templates/show.html.erb"})
  end
def create
    user = User.new
    user.username = params.fetch("input_username")
    user.save
    
    redirect_to("/users/#{user.username}")
  end
  
  def update
    user_id = params.fetch("user_id")
    matching_users = User.where({ :username => user_id })
    the_user = matching_users.at(0)
    
    the_user.username = params.fetch("query_username")
    the_user.save
    redirect_to("/users/#{the_user.username}")
  end
end
