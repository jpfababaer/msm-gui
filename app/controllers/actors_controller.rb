class ActorsController < ApplicationController
  def index
    matching_actors = Actor.all
    @list_of_actors = matching_actors.order({ :created_at => :desc })

    render({ :template => "actor_templates/index" })
  end

  def show
    the_id = params.fetch("path_id")

    matching_actors = Actor.where({ :id => the_id })
    @the_actor = matching_actors.at(0)
      
    render({ :template => "actor_templates/show" })
  end

  def create

    actor_instance = Actor.new
    actor_instance.name = params.fetch("name_info")
    actor_instance.dob = params.fetch("dob_info")
    actor_instance.bio = params.fetch("bio_info")
    actor_instance.image = params.fetch("image_info")

    actor_instance.save

    redirect_to("/actors")

  end

  def destroy
    the_id = params.fetch("an_id")
    matching_records = Actor.where({id: the_id})
    the_actor = matching_records.at(0)

    the_actor.destroy

    redirect_to("/actors")

  end

  def update
    the_id = params.fetch("the_id")
    matching_records = Actor.where({id: the_id})
    actor_instance = matching_records.at(0)

    actor_instance.name = params.fetch("name_info")
    actor_instance.dob = params.fetch("dob_info")
    actor_instance.bio = params.fetch("bio_info")
    actor_instance.image = params.fetch("image_info")

    actor_instance.save

    redirect_to("/actors/#{the_id}")

  end


end
