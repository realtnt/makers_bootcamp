require 'music_library'
require 'track'

RSpec.describe 'Music Library Integration: ' do
  context 'Adding tracks' do
    music_library = MusicLibrary.new
    it 'should return []' do
      expect(music_library.all).to eq []
    end
    track_1 = Track.new('Bad Medicine', 'Jon Bon Jovi')
    it 'should return [track_1]' do     
      music_library.add(track_1)
      expect(music_library.all).to eq [track_1]
    end
    track_2 = Track.new('Best Song in the World', 'Tenacious D')
    it 'should return [track_1, track_2]' do
      music_library.add(track_2)
      expect(music_library.all).to eq [track_1, track_2]
    end
  end
  context 'Searching for tracks' do
    music_library = MusicLibrary.new
    track_1 = Track.new('Bad Medicine', 'Jon Bon Jovi')
    track_2 = Track.new('Best Song in the World', 'Tenacious D')
    track_3 = Track.new('Best Vibes', 'Some Guy')
    music_library.add(track_1)
    music_library.add(track_2)
    music_library.add(track_3)
    it 'should return [track_1]' do
      expect(music_library.search('Bad')).to eq [track_1]
    end
    it 'should return [track_2]' do
      expect(music_library.search('Song')).to eq [track_2]
    end
    it 'should return []' do
      expect(music_library.search('rumpelstiltskin')).to eq []
    end
    it 'should return [track_2, track_3]' do
      expect(music_library.search('Best')).to eq [track_2, track_3]
    end
  end
end