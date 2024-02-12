class DirectorsController < ApplicationController
  def index
    matching_directors = Director.all
    @list_of_directors = matching_directors.order({ :created_at => :desc })

    render({ :template => "director_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_directors = Director.where({ :id => the_id })
    @the_director = matching_directors.at(0)

    render({ :template => "director_templates/show" })
  end

  def max_dob
    directors_by_dob_desc = Director.
      all.
      where.not({ :dob => nil }).
      order({ :dob => :desc })

    @youngest = directors_by_dob_desc.at(0)

    render({ :template => "director_templates/youngest" })
  end

  def min_dob
    directors_by_dob_asc = Director.
      all.
      where.not({ :dob => nil }).
      order({ :dob => :asc })
      
    @eldest = directors_by_dob_asc.at(0)

    render({ :template => "director_templates/eldest" })
  end

  def create
  #Params: {"name_info"=>"John", "dob_info"=>"2024-02-14", "bio_info"=>"Hello world", "image_info"=>"653345"}

  director_instance = Director.new
  director_instance.name = params.fetch("name_info")
  director_instance.dob = params.fetch("dob_info")
  director_instance.bio = params.fetch("bio_info")
  director_instance.image = params.fetch("image_info")

  director_instance.save

  redirect_to("/directors")
  end

  def destroy
    the_id = params.fetch("an_id")
    matching_records = Director.where({ id: the_id})
    the_director = matching_records.at(0)

    the_director.destroy

    redirect_to("/directors")
  end

  def update
    the_id = params.fetch("the_id")
    matching_records = Director.where({ id: the_id})
    director_instance = matching_records.at(0)

    director_instance.name = params.fetch("name_info")
    director_instance.dob = params.fetch("dob_info")
    director_instance.bio = params.fetch("bio_info")
    director_instance.image = params.fetch("image_info")

    director_instance.save

    redirect_to("/directors/#{the_id}")

  end 

end
