class MoviesController < ApplicationController
  def index
    matching_movies = Movie.all
    @list_of_movies = matching_movies.order({ :created_at => :desc })

    render({ :template => "movie_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_movies = Movie.where({ :id => the_id })
    @the_movie = matching_movies.at(0)

    render({ :template => "movie_templates/show" })
  end

  def create
    #Params: {"the_title"=>"1", "the_year"=>"2", "the_duration"=>"3", "the_description"=>"4", "the_image"=>"5", "the_director_id"=>"6"}

    #Retrieve the user's input from params
    #Create a record in the movie table
    #Populate each column with the user input
    m = Movie.new
    m.title = params.fetch("the_title")
    m.year = params.fetch("the_year")
    m.duration = params.fetch("the_duration")
    m.description = params.fetch("the_description")
    m.image = params.fetch("the_image")
    m.director_id = params.fetch("the_director_id")

    #Save

    m.save

    #1 This is where we learn what redirect_to() method does: pass a String URL which we want the user to be REDIRECTED to after clicking the button. This allows us to "connect the dots". SEARCH /movie_templates/index.html.erb
    redirect_to("/movies")
  end
    
  def destroy
    the_id = params.fetch("an_id")

    matching_records = Movie.where({ id: the_id })

    the_movie = matching_records.at(0)

    the_movie.destroy

    redirect_to("/movies")
  end 

  def update
    #7 The "the_id" here is defined via the post() method we defined back in the routes.rb (#6). We place the actual value for "the_id" inside of our /movie_templates/show.html.erb file (#5). This is how we tell Rails which movie we're trying to update. SEARCH director_templates/index.html.erb = START OF CHALLENGE
    m_id = params.fetch("the_id")
    matching_records = Movie.where({ id: m_id})
    the_movie = matching_records.at(0)

    the_movie.title = params.fetch("the_title")
    the_movie.year = params.fetch("the_year")
    the_movie.duration = params.fetch("the_duration")
    the_movie.description = params.fetch("the_description")
    the_movie.image = params.fetch("the_image")
    the_movie.director_id = params.fetch("the_director_id")
    
    #Save the Instance (Row information)
    the_movie.save
    
    redirect_to("/movies/#{the_movie.id}")

  end
end
