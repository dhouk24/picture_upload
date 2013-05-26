get '/' do
  erb :index
end

get '/albums' do
  @albums = Album.all
  erb :albums
end

get '/albums/new' do
  erb :new_album
end

get '/albums/:album_id' do
  @album = Album.find(params[:album_id])
  erb :album_carousel
end

get '/albums/:album_id/upload' do
	@album_id = params[:album_id]
  erb :uploader
end

get "/albums/:album_id/view" do 
	@photos = Album.find(params[:album_id]).photos
	"Alrighty then"
	erb :photo_view
end

post '/albums/:album_id/upload' do
	@photo = Photo.new(:file => params[:file], :album_id => params[:album_id])
	@photo.save
	redirect "/albums/#{params[:album_id]}"
end

post '/albums/new' do
  @album = Album.create(:title => params[:title], :user_id => current_user.id)
  redirect '/albums'
end