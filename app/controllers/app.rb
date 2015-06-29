class App < Sinatra::Base
  set :views, Proc.new { File.join(root, '../views')}

  get '/' do
    @songs = Song.all
    erb :'songs/index'
  end

  get '/songs/:id' do
    @song = Song.find(params[:id])
    erb :'songs/show'
  end

  get '/songs/:id/edit' do
    @song = Song.find(params[:id])
    erb :'songs/edit'
  end

  post '/songs/:id/edit' do
    song = params[:song]
    title, artist, album, genre, length = song[:title], song[:artist], song[:album], song[:genre], song[:length]
    Song.update(params[:id], title: title, artist: artist, album: album, genre: genre, length: length)
    redirect('/songs/' + params[:id])
  end
  
end

