require "sinatra"
require "pg"

database = PG.connect( dbname: 'photo_galleries' )

get "/" do
  erb :index
end  

get "/galleries/:id" do
  @id = params[:id]
  gallery = database.exec_params( 
    "SELECT * FROM galleries WHERE id = $1",
    [@id]
  ).first
  @title = gallery["name"]
  images = database.exec_params(
    "SELECT * FROM images WHERE gallery_id = $1",
    [@id]
  )
  @images = images.map{ |image| image["url"] }
  erb :gallery
end