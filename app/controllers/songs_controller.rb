class SongsController < ApplicationController
  before_action :require_login
def index
  puts "*****songs index controller*****"
  @song_list = Song.all

end
def create
  puts "*****songs create controller*****"
  @songs = Song.create(song_params)
  Playlist.create(user_id: @songs.user_id, song_id: @songs.id)

  return redirect_to all_songs_path if @songs.valid?

  flash[:errors] = @songs.errors.full_messages
  return redirect_to :back

end
def show
  @song = Song.find(params[:id])

end
  private
  def song_params
    params.require(:song).permit(:title, :artist).merge(user:current_user)
  end
end
