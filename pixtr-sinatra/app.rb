require "sinatra"
require "active_record"
require "pg"

ActiveRecord::Base.establish_connection({
  adapter: 'postgresql',
  database: 'photo_galleries'
})

class Gallery < ActiveRecord::Base
  has_many :images
end

class Image < ActiveRecord::Base
end

get "/" do
  @galleries = Gallery.all
  erb :index
end  

post "/galleries" do
  gallery = Gallery.create(params[:gallery])
  redirect "/galleries/#{gallery.id}"
end

get "/galleries/new" do
  erb :new_gallery
end

get "/galleries/:id" do
  @gallery = Gallery.find(params[:id])
  @images = @gallery.images.order(:id)
  erb :gallery
end

get "/galleries/:id/edit" do
  @gallery = Gallery.find(params[:id])
  erb :edit_gallery
end

patch "/galleries/:id" do
  gallery = Gallery.find(params[:id])
  gallery.update(params[:gallery])
  redirect "/galleries/#{gallery.id}"
end

delete "/galleries/:id" do
  gallery = Gallery.find(params[:id])
  gallery.destroy
  redirect "/"
end

get "/galleries/:id/images/new" do
  @gallery = Gallery.find(params[:id])
  erb :new_image
end

post "/galleries/:id/images" do
  gallery = Gallery.find(params[:id])
  gallery.images << Image.new(params[:image])
  redirect "/galleries/#{gallery.id}"
end

delete "/galleries/:gallery_id/images/:id" do
  image = Image.find(params[:id])
  image.destroy
  redirect "/galleries/#{params[:gallery_id]}"
end

get "/galleries/:gallery_id/images/:id/edit" do
  @gallery = Gallery.find(params[:gallery_id])
  @image = Image.find(params[:id])
  erb :edit_image
end

patch "/galleries/:gallery_id/images/:id" do
  gallery = Gallery.find(params[:gallery_id])
  image = Image.find(params[:id])
  image.update(params[:image])
  redirect "/galleries/#{gallery.id}"
end

  
  
