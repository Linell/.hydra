-- Helper functions for controlling spotify via AppleScript
--
-- Based off of https://github.com/af/dotfiles/blob/master/hydra/itunes.lua
ext.spotify = {}

function ext.spotify.tell(cmd)
  return hydra.exec('osascript -e \'tell application "Spotify" to ' .. cmd .. "'")
end

function ext.spotify.play()
  ext.spotify.tell('playpause')
  hydra.alert(' ▶', 0.5)
end

function ext.spotify.pause()
  ext.spotify.tell('pause')
  hydra.alert(' ◼', 0.5)
end

function ext.spotify.next()
  ext.spotify.tell('next track')
end

function ext.spotify.previous()
  ext.spotify.tell('previous track')
end

function ext.spotify.currentTrack()
  local artist = ext.spotify.tell('get the artist of the current track')
  local album = ext.spotify.tell('get the album of the current track')
  local track = ext.spotify.tell('get the name of the current track')
  hydra.alert(track .. '\n' .. album .. '\n' .. artist, 1.5);
  -- notify.show(track .. ' - ' .. artist, album, "", "") notification center notification
end
