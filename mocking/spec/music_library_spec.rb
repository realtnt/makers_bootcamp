require 'music_library'

RSpec.describe MusicLibrary do
  context 'Adding tracks' do
    it 'should return []' do
      music_library = MusicLibrary.new
      expect(music_library.all).to eq []
    end
    it 'should return [track_1]' do
      music_library = MusicLibrary.new
      track_1 = double :track
      music_library.add(track_1)
      expect(music_library.all).to eq [track_1]
    end
    it 'should return [track_1, track_2]' do
      music_library = MusicLibrary.new
      track_1 = double :track
      track_2 = double :track
      music_library.add(track_1)
      music_library.add(track_2)
      expect(music_library.all).to eq [track_1, track_2]
    end
  end
  context 'Searching for tracks' do
    it 'should return [track_1]' do
      music_library = MusicLibrary.new
      track_1 = double :track, matches?: true
      track_2 = double :track, matches?: false
      music_library.add(track_1)
      music_library.add(track_2)
      expect(music_library.search('keyword')).to eq [track_1]
    end
  end
end