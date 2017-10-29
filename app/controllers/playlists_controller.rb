class PlaylistsController < ApplicationController
before_action :require_login
def create
  puts "*****youre in the playlist create method*****"
  @playlist = Playlist.create(user_id: current_user.id, song_id: params[:id])
  return redirect_to all_songs_path
end

end
