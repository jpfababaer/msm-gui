#NOTES: The first note starts at movies_controller.rb

Rails.application.routes.draw do
  get("/", { :controller => "misc", :action => "homepage" })

  #----------------------------------------
  #Directors
  get("/directors/youngest", { :controller => "directors", :action => "max_dob" })
  get("/directors/eldest", { :controller => "directors", :action => "min_dob" })

  get("/directors", { :controller => "directors", :action => "index" })
  get("/directors/:path_id", { :controller => "directors", :action => "show" })
  post("/insert_director" , {controller: "directors", action: "create"})
  get("/delete_director/:an_id", {controller: "directors", action: "destroy"})
  post("/modify_director/:the_id", { controller: "directors", action: "update"})

  #----------------------------------------
  #Movies
  get("/movies", { :controller => "movies", :action => "index" })
  get("/movies/:path_id", { :controller => "movies", :action => "show" })
  post("/insert_movie_record", { controller: "movies", action: "create" })
  get("/delete_movie/:an_id" , { controller: "movies", action: "destroy"})

  #6 The form will only work once we define the connecting dots. Since we are dealing with forms, we use POST(). Lastly, we have to define the method "update" in the Controller "movies" and provide necessary Ruby logic. SEARCH movies_controller.rb 
  post("/modify_movie_record/:the_id", {controller: "movies", action: "update"})
  
  #----------------------------------------
  #Actors
  get("/actors", { :controller => "actors", :action => "index" })
  get("/actors/:path_id", { :controller => "actors", :action => "show" })
  post("/insert_actor", {controller: "actors", action: "create"})
  get("/delete_actor/:an_id" , { controller: "actors", action: "destroy"})
  post("/modify_actor/:the_id", {controller: "actors", action: "update"})

end
